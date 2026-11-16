"""Skill step 5: test a made web project in a phone-sized browser before building.

Usage: python3 ci/web/test.py <project dir> <out dir>
Serves App/www at http://app.test/, gives the page the same bridge script the iOS app
uses (taken from BridgeScript.swift) and a fake native side that keeps files in memory.
Writes screenshots and a report: page errors, failed requests, bridge calls, and whether
a save survives a reload.
"""
import json, os, re, sys
from playwright.sync_api import sync_playwright

proj, out = sys.argv[1:3]
os.makedirs(out, exist_ok=True)
www = os.path.abspath(os.path.join(proj, "App", "www"))
swift = open(os.path.join(proj, "App", "BridgeScript.swift")).read()
parts = re.findall(r'#"""\n(.*?)\n"""#', swift, re.S)
common, cordova = parts[0], parts[1]
kind = re.search(r'kind = "(\w+)"', open(os.path.join(proj, "App", "AppConfig.swift")).read()).group(1)

FAKE_NATIVE = """
(function(){
  var files = JSON.parse(sessionStorage.getItem('__files') || '{}'); window.__calls = [];
  function save(){ sessionStorage.setItem('__files', JSON.stringify(files)); }
  window.webkit = { messageHandlers: { native: { postMessage: function(m){
    window.__calls.push(m.action);
    var a = m.args || {};
    switch (m.action) {
      case 'readFile': return Promise.resolve(files.hasOwnProperty(a.name) ? files[a.name] : null);
      case 'writeFile': files[a.name] = a.data; save(); return Promise.resolve(true);
      case 'removeFile': delete files[a.name]; save(); return Promise.resolve(true);
      case 'listFiles': return Promise.resolve(Object.keys(files));
      default: return Promise.resolve(true);
    }
  } } } };
})();
"""
MIME = {"html": "text/html", "js": "text/javascript", "css": "text/css", "json": "application/json", "png": "image/png",
        "jpg": "image/jpeg", "svg": "image/svg+xml", "woff2": "font/woff2", "woff": "font/woff", "ttf": "font/ttf",
        "mp3": "audio/mpeg", "ogg": "audio/ogg", "wav": "audio/wav", "wasm": "application/wasm", "webp": "image/webp"}

report = {"kind": kind, "page_errors": [], "console_errors": [], "missing": [], "calls": []}


def handle(route):
    path = route.request.url.split("app.test/", 1)[1].split("?")[0].split("#")[0] or "index.html"
    if kind == "cordova" and path.endswith("cordova.js"):
        return route.fulfill(status=200, body=common + "\n" + cordova, content_type="text/javascript")
    if kind == "cordova" and path.endswith("cordova_plugins.js"):
        return route.fulfill(status=200, body="cordova.define('cordova/plugin_list',function(r,e,m){m.exports=[];});", content_type="text/javascript")
    f = os.path.normpath(os.path.join(www, path))
    if not os.path.isfile(f) and "." not in os.path.basename(path):  # page-router path: serve the start page, like the app
        f = os.path.join(www, "index.html")
    if not f.startswith(www + os.sep) or not os.path.isfile(f):
        report["missing"].append(path)
        return route.fulfill(status=404, body="")
    return route.fulfill(status=200, body=open(f, "rb").read(), content_type=MIME.get(f.rsplit(".", 1)[-1].lower(), "application/octet-stream"))


with sync_playwright() as p:
    browser = p.chromium.launch()
    ctx = browser.new_context(**p.devices["iPhone 14 Pro Max"])
    ctx.add_init_script(FAKE_NATIVE)
    if kind != "cordova":
        ctx.add_init_script(common)
    ctx.route("http://app.test/**", handle)
    ctx.route(re.compile(r"^https?://(?!app\.test).*"), lambda r: r.abort())  # stay offline, like the app
    page = ctx.new_page()
    page.on("pageerror", lambda e: report["page_errors"].append(str(e)[:300]))
    page.on("console", lambda m: m.type == "error" and report["console_errors"].append(m.text[:300]))
    page.goto("http://app.test/index.html", wait_until="load", timeout=60000)
    page.evaluate("window.__safeInsets && window.__safeInsets(59,34,0,0)")
    page.wait_for_timeout(6000)
    page.screenshot(path=os.path.join(out, "1-start.png"))
    vw, vh = page.viewport_size["width"], page.viewport_size["height"]
    for x, y in [(vw // 2, vh // 2), (vw // 2, int(vh * 0.6)), (vw // 3, int(vh * 0.7))]:
        page.touchscreen.tap(x, y)
        page.wait_for_timeout(800)
    page.screenshot(path=os.path.join(out, "2-after-taps.png"))
    report["calls"] = page.evaluate("window.__calls || []")
    page.reload(wait_until="load")
    page.wait_for_timeout(4000)
    page.screenshot(path=os.path.join(out, "3-after-reload.png"))
    report["calls_after_reload"] = page.evaluate("window.__calls || []")
    report["local_storage_keys"] = page.evaluate("Object.keys(localStorage)")
    browser.close()

report["missing"] = sorted(set(report["missing"]))[:40]
json.dump(report, open(os.path.join(out, "test.json"), "w"), indent=1)
print(json.dumps(report, indent=1)[:4000])

"""HTML5 game engines on the web route: name the engine of a made project (ci/web/make.py output),
report what matters for iPhone, and apply the few engine fixes needed.

Usage: python3 -I ci/web2/engine.py <project dir>
- RPG Maker MV asks for .m4a audio on phones (AudioManager.audioFileExt: .ogg only on desktop); if a game ships
  only .ogg, convert to .m4a with ffmpeg so music and sounds play.
- Real iPhones have case-sensitive file names (the simulator and Windows don't): list references in the game's
  data whose case doesn't match the file.
- nw.js leftovers (package.json with "main", node-only plugins) are listed.
"""
import json, os, re, subprocess, sys

proj = sys.argv[1]
www = os.path.join(proj, "App", "www")
files = [os.path.relpath(os.path.join(d, f), www) for d, _, fs in os.walk(www) for f in fs]
fset = set(files)
lower = {}
for f in files:
    lower.setdefault(f.lower(), []).append(f)
has = lambda p: p in fset
out = []

engine = "unknown HTML5"
if has("js/rmmz_core.js"):
    engine = "RPG Maker MZ"
elif has("js/rpg_core.js"):
    engine = "RPG Maker MV"
elif any(f.endswith("gd.js") or "/gdjs" in f or f.startswith("pixi-renderers/") for f in files) or has("events-tools/runtimescene-tools.js"):
    engine = "GDevelop"
elif any(re.search(r"c3runtime\.js$|c2runtime\.js$", f) for f in files):
    engine = "Construct"
elif any("phaser" in f.lower() for f in files):
    engine = "Phaser"
out.append(f"engine: {engine}")

ext = {}
for f in files:
    if f.startswith(("audio/", "sounds/", "sfx/")) or re.search(r"\.(ogg|m4a|mp3|wav|aac|opus)$", f, re.I):
        e = f.rsplit(".", 1)[-1].lower()
        ext[e] = ext.get(e, 0) + 1
out.append(f"audio files by type: {ext}")

if engine.startswith("RPG Maker"):
    core = open(os.path.join(www, "js", "rmmz_core.js" if engine.endswith("MZ") else "rpg_core.js"), errors="ignore").read()
    v = re.search(r"(?:RPG Maker \w+ - )?v?(\d+\.\d+\.\d+)", core[:400])
    out.append(f"core version: {v.group(1) if v else '?'}")
    if os.path.exists(os.path.join(www, "package.json")):
        out.append("nw.js leftover: www/package.json (desktop launcher config; unused in a web view, left in place)")
    plugins = open(os.path.join(www, "js", "plugins.js"), errors="ignore").read() if has("js/plugins.js") else ""
    names = re.findall(r'"name"\s*:\s*"([^"]+)"\s*,\s*"status"\s*:\s*true', plugins)
    out.append(f"active plugins ({len(names)}): {', '.join(names)[:600]}")
    node = []
    for n in names:
        p = os.path.join(www, "js", "plugins", n + ".js")
        if os.path.exists(p):
            t = open(p, errors="ignore").read()
            if re.search(r"require\(['\"](fs|path|nw\.gui|child_process)['\"]\)", t):
                node.append(n)
    out.append("plugins that call nw.js/node (need Utils.isNwjs() guards or a rewrite): " + (", ".join(node) or "none"))
    if engine.endswith("MV") and ext.get("ogg") and not ext.get("m4a"):
        conv = 0
        for f in files:
            if f.startswith("audio/") and f.lower().endswith(".ogg"):
                src = os.path.join(www, f); dst = src[:-4] + ".m4a"
                r = subprocess.run(["ffmpeg", "-loglevel", "error", "-y", "-i", src, "-c:a", "aac", "-b:a", "128k", dst])
                conv += r.returncode == 0
        out.append(f"FIX: MV game ships only .ogg but asks for .m4a on phones: converted {conv} files to .m4a")
    elif engine.endswith("MV"):
        out.append("audio: .m4a present, MV plays them on iPhone (it picks .m4a on any phone)")
    else:
        out.append("audio: MZ always loads .ogg and decodes it in JS/wasm (VorbisDecoder), so no conversion needed")
    # file-name case: names used in data/*.json and plugins.js vs files on disk
    used = set()
    for f in files:
        if f.startswith("data/") and f.endswith(".json"):
            used |= set(re.findall(r'"([^"\\/]{1,80})"', open(os.path.join(www, f), errors="ignore").read()))
    bad = []
    for f in files:
        if f.startswith(("img/", "audio/", "movies/")):
            base = os.path.splitext(os.path.basename(f))[0]
            for u in used:
                if u != base and u.lower() == base.lower():
                    bad.append(f"{f} (data says '{u}')")
    out.append("file-name case mismatches (break on a real iPhone only): " + (", ".join(sorted(set(bad))[:20]) or "none"))
    # WebKit fixes, loaded before the engine: PIXI 4 (MV) draws maps black on WebKit's WebGL with its VAO extension, so
    # PIXI is told there is none (it has its own fallback). MV_RENDER=canvas also forces MV's canvas renderer
    # (MV reads "?canvas" from the address). Scene changes and a lost WebGL context go to the console (the
    # simulator run logs console errors).
    canvas = os.environ.get("MV_RENDER") == "canvas"
    fix = """(function () {
  var ge = WebGLRenderingContext.prototype.getExtension;
  WebGLRenderingContext.prototype.getExtension = function (n) { return n === 'OES_vertex_array_object' ? null : ge.apply(this, arguments); };
  if (%s) history.replaceState(null, '', location.pathname + '?canvas');
  document.addEventListener('webglcontextlost', function () { console.error('[mv] WebGL context lost'); }, true);
  var last;
  setInterval(function () {
    var s = window.SceneManager && SceneManager._scene, n = s && s.constructor.name;
    if (n && n !== last) { last = n; console.error('[mv] scene ' + n + (Graphics.isWebGL() ? ' (WebGL)' : ' (canvas)')); }
  }, 500);
})();
""" % ("true" if canvas else "false")
    open(os.path.join(www, "js", "ios-fixes.js"), "w").write(fix)
    ip = os.path.join(www, "index.html"); t = open(ip, errors="ignore").read()
    if "ios-fixes.js" not in t:
        t = t.replace("<script", '<script type="text/javascript" src="js/ios-fixes.js"></script>\n        <script', 1)
        open(ip, "w").write(t)
    out.append("FIX: js/ios-fixes.js before the engine: PIXI without the WebGL VAO extension" + ("; canvas renderer forced" if canvas else "") + "; scene log")
elif engine == "GDevelop":
    gd = open(os.path.join(www, "data.js"), errors="ignore").read() if has("data.js") else ""
    m = re.search(r'"sizeOnStartupMode"\s*:\s*"(\w*)"', gd)
    out.append(f"sizeOnStartupMode: {m.group(1) if m else '?'}; adaptGameResolutionAtRuntime: {'true' if re.search(r'adaptGameResolutionAtRuntime.{0,3}true', gd) else 'false/?'}")
    w = re.search(r'"windowWidth"\s*:\s*(\d+)', gd); h = re.search(r'"windowHeight"\s*:\s*(\d+)', gd)
    o = re.search(r'"orientation"\s*:\s*"(\w+)"', gd)
    out.append(f"game size: {w.group(1) if w else '?'}x{h.group(1) if h else '?'}; orientation in project: {o.group(1) if o else '?'}")
    plist = os.path.join(proj, "App", "Info.plist")
    if o and o.group(1) in ("landscape", "portrait"):
        # GDevelop locks orientation at runtime (screen-orientation plugin), so the Android manifest often says nothing
        t = open(plist).read()
        want = ("<string>UIInterfaceOrientationLandscapeLeft</string><string>UIInterfaceOrientationLandscapeRight</string>"
                if o.group(1) == "landscape" else "<string>UIInterfaceOrientationPortrait</string>")
        t2 = re.sub(r"(<key>UISupportedInterfaceOrientations[^<]*</key>\s*<array>).*?(</array>)", lambda m: m.group(1) + want + m.group(2), t, flags=re.S)
        if t2 != t:
            open(plist, "w").write(t2); out.append(f"FIX: orientation set to the GDevelop project's '{o.group(1)}' (manifest had none)")
    ext_dir = os.path.join(www, "Extensions")
    out.append("Extensions folder: " + (", ".join(sorted(os.listdir(ext_dir))) if os.path.isdir(ext_dir) else "none"))

# Orientation when the Android manifest leaves it open: a web manifest's "orientation", or a "rotate your device"
# notice in index.html/CSS (Shadow Runner, Phaser: shown in portrait, so the game never showed in the simulator).
plist = os.path.join(proj, "App", "Info.plist")
pt = open(plist).read()
if "Portrait" in pt and "Landscape" in pt:
    want = None
    if has("manifest.json"):
        m = re.search(r'"orientation"\s*:\s*"(\w+)', open(os.path.join(www, "manifest.json"), errors="ignore").read())
        if m and m.group(1).startswith(("landscape", "portrait")): want = m.group(1)[:9].rstrip("-")
    if not want:
        page = "".join(open(os.path.join(www, f), errors="ignore").read() for f in files if f.endswith((".html", ".css")) and f.count("/") < 2)
        if re.search(r"rotate (your )?(device|phone|screen)|rotate-notice|orientation\s*:\s*portrait\)", page, re.I):
            want = "landscape"
    if want in ("landscape", "portrait"):
        w = ("<string>UIInterfaceOrientationLandscapeLeft</string><string>UIInterfaceOrientationLandscapeRight</string>"
             if want == "landscape" else "<string>UIInterfaceOrientationPortrait</string>")
        open(plist, "w").write(re.sub(r"(<key>UISupportedInterfaceOrientations[^<]*</key>\s*<array>).*?(</array>)", lambda m: m.group(1) + w + m.group(2), pt, flags=re.S))
        out.append(f"FIX: orientation set to {want} (the web manifest or a 'rotate your device' notice asks for it; Android's manifest had none)")

# native calls (step 2 grep) outside libraries
js = [f for f in files if f.endswith(".js")]
hits = {}
pat = re.compile(r"(cordova\.[a-zA-Z.]+|Capacitor\.[a-zA-Z.]+|navigator\.(?:app|vibrate|splashscreen)|window\.plugins\.[a-zA-Z]+|admob|AdMob|resolveLocalFileSystemURL|require\(['\"](?:fs|path|nw\.gui)['\"]\))")
for f in js:
    for m in pat.findall(open(os.path.join(www, f), errors="ignore").read()):
        hits[m] = hits.get(m, 0) + 1
out.append("native calls found: " + (json.dumps(dict(sorted(hits.items(), key=lambda x: -x[1])[:25])) if hits else "none"))
print("\n".join("- " + x for x in out))

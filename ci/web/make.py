"""Make an iOS project (skill steps 2-3) from any web-based APK, using ci/web/template.

Usage: python3 ci/web/make.py <apk> <unpacked dir> <out dir> <bundle id>
Finds the web folder (Cordova assets/www, Capacitor's webDir, or the shallowest index.html),
reads name / version / orientation / icon with androguard, and fills in the template.
Prints a short report.
"""
import io, json, os, re, shutil, sys, zipfile

apk, unpacked, out, bundle = sys.argv[1:5]
tmpl = os.path.join(os.path.dirname(__file__), "template")
assets = os.path.join(unpacked, "assets")
report = []

# --- what kind of web app, and where its files are
kind, web = "web", None
cap = os.path.join(assets, "capacitor.config.json")
if os.path.exists(cap):
    kind = "capacitor"
    cfg = json.load(open(cap))
    web = os.path.join(assets, "public")  # Android builds always copy webDir to assets/public
    report.append(f"Capacitor app ({cfg.get('appName')}), plugins: {open(os.path.join(assets, 'capacitor.plugins.json')).read()[:300] if os.path.exists(os.path.join(assets, 'capacitor.plugins.json')) else 'none listed'}")
elif os.path.exists(os.path.join(assets, "www", "index.html")):
    kind, web = "cordova", os.path.join(assets, "www")
else:
    found = []
    for d, _, files in os.walk(assets):
        if "index.html" in files:
            found.append((d.count(os.sep), d))
    if not found:
        sys.exit("no index.html anywhere in assets/: not a web app")
    web = sorted(found)[0][1]
report.append(f"kind: {kind}; web folder: {os.path.relpath(web, unpacked)}")

# --- the APK's own facts
try:
    try:
        from androguard.core.apk import APK
    except ImportError:
        from androguard.core.bytecodes.apk import APK
    a = APK(apk)
    name = a.get_app_name() or "App"
    vname, vcode = a.get_androidversion_name() or "1.0", a.get_androidversion_code() or "1"
    xml = a.get_android_manifest_axml().get_xml().decode()
    icon_path = a.get_app_icon()
except Exception as e:  # noqa: BLE001
    report.append(f"androguard failed ({e}); using defaults")
    name, vname, vcode, xml, icon_path = "App", "1.0", "1", "", None
m = re.search(r'screenOrientation="(\w+)"', xml)
orient = m.group(1) if m else "unspecified"
# androguard often gives the number Android stores, not the name
NUM = {"0": "landscape", "1": "portrait", "6": "sensorLandscape", "7": "sensorPortrait", "8": "reverseLandscape",
       "9": "reversePortrait", "11": "userLandscape", "12": "userPortrait", "-1": "unspecified", "4": "sensor", "10": "fullSensor"}
orient = NUM.get(orient, orient)
if "landscape" in orient.lower():
    o = ["UIInterfaceOrientationLandscapeLeft", "UIInterfaceOrientationLandscapeRight"]
elif "portrait" in orient.lower():
    o = ["UIInterfaceOrientationPortrait"]
else:
    o = ["UIInterfaceOrientationPortrait", "UIInterfaceOrientationLandscapeLeft", "UIInterfaceOrientationLandscapeRight"]
report.append(f"name: {name}; version {vname} ({vcode}); orientation: {orient}")

# --- fill the template
if os.path.exists(out):
    shutil.rmtree(out)
shutil.copytree(tmpl, out)
www = os.path.join(out, "App", "www")
shutil.copytree(web, www)
if kind == "cordova":
    for x in ("cordova.js", "cordova_plugins.js"):
        p = os.path.join(www, x)
        if os.path.exists(p):
            os.remove(p)
    plugins = os.path.join(www, "plugins")
    if os.path.isdir(plugins):
        report.append("Cordova plugins in the app (their native side is missing on iOS; check each): "
                      + ", ".join(sorted(os.listdir(plugins))))
        shutil.rmtree(plugins)
open(os.path.join(out, "App", "AppConfig.swift"), "w").write(
    f'enum AppConfig {{\n    static let startPage = "index.html"\n    static let kind = "{kind}"\n}}\n')
safe_ver = re.sub(r"[^0-9.]", "", str(vname)) or "1.0"
for f, subs in [("project.yml", {"__BUNDLE__": bundle, "__VERSION__": safe_ver, "__BUILD__": str(vcode)}),
                (os.path.join("App", "Info.plist"), {"__NAME__": name.replace("&", "&amp;").replace("<", "&lt;"),
                                                     "__ORIENTATIONS__": "".join(f"<string>{x}</string>" for x in o)})]:
    p = os.path.join(out, f)
    t = open(p).read()
    for k, v in subs.items():
        t = t.replace(k, v)
    open(p, "w").write(t)

# --- icon: opaque 1024x1024
try:
    from PIL import Image
    data = None
    if icon_path and icon_path.endswith(".png"):
        data = zipfile.ZipFile(apk).read(icon_path)
    if data is None:  # adaptive icon (xml): take the biggest launcher png in res/
        z = zipfile.ZipFile(apk)
        pngs = [(z.getinfo(n).file_size, n) for n in z.namelist() if n.startswith("res/") and n.endswith(".png") and "launcher" in n]
        data = z.read(sorted(pngs)[-1][1]) if pngs else None
    icon_dir = os.path.join(out, "App", "Assets.xcassets", "AppIcon.appiconset")
    os.makedirs(icon_dir, exist_ok=True)
    img = Image.open(io.BytesIO(data)).convert("RGBA") if data else Image.new("RGBA", (64, 64), (40, 40, 40, 255))
    bg = Image.new("RGBA", (1024, 1024), img.getpixel((img.width // 2, 2)) if data else (40, 40, 40, 255))
    bg = Image.new("RGBA", (1024, 1024), (bg.getpixel((0, 0))[:3] + (255,)))
    big = img.resize((1024, 1024), Image.LANCZOS)
    bg.alpha_composite(big)
    bg.convert("RGB").save(os.path.join(icon_dir, "icon-1024.png"))
    json.dump({"images": [{"filename": "icon-1024.png", "idiom": "universal", "platform": "ios", "size": "1024x1024"}],
               "info": {"author": "xcode", "version": 1}}, open(os.path.join(icon_dir, "Contents.json"), "w"))
    json.dump({"info": {"author": "xcode", "version": 1}}, open(os.path.join(out, "App", "Assets.xcassets", "Contents.json"), "w"))
    report.append(f"icon from {icon_path or 'largest launcher png'}")
except Exception as e:  # noqa: BLE001
    report.append(f"icon failed: {e}")

n_files = sum(len(f) for _, _, f in os.walk(www))
report.append(f"web files: {n_files}")
print("\n".join("- " + r for r in report))

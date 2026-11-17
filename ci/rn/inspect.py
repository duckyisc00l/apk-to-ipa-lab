"""React Native APK -> facts for the host-app route.

Usage: python3 -I inspect.py <merged apk dir (unpack.py all/)> <out dir>
Writes <out>/rn.json and <out>/rn.md:
- bundle kind: plain JS or Hermes bytecode (+ Hermes bytecode version)
- React Native version (from the bundle's ReactNativeVersion, else from native libs)
- native modules/components the JS asks for, split into core (ship with RN) and third-party
- images: Android keeps RN images in res/drawable-*/<path_with_underscores>.png; the iOS
  host needs them at assets/<httpServerLocation>/<name>@<scale>x.<type>. The mapping is
  rebuilt from the bundle's asset registrations and written to <out>/assets/.
"""
import json, os, re, shutil, struct, sys

src, out = sys.argv[1], sys.argv[2]
os.makedirs(out, exist_ok=True)
bundle = None
for cand in ("assets/index.android.bundle", "assets/index.bundle", "assets/main.jsbundle"):
    if os.path.exists(os.path.join(src, cand)):
        bundle = os.path.join(src, cand)
        break
if not bundle:
    for d, _, fs in os.walk(os.path.join(src, "assets")):
        for f in fs:
            if f.endswith(".bundle"):
                bundle = os.path.join(d, f)
data = open(bundle, "rb").read() if bundle else b""
hermes = data[:8] == bytes.fromhex("c61fbc03c103191f")
info = {"bundle": os.path.relpath(bundle, src) if bundle else None, "size": len(data),
        "kind": "hermes" if hermes else "plain JS" if data else None}
if hermes:
    info["hermes_bytecode_version"] = struct.unpack("<I", data[8:12])[0]
text = data.decode("utf-8", "replace") if not hermes else data.decode("latin1")

# RN version: Libraries/Core/ReactNativeVersion.js -> {major:0,minor:N,patch:N,prerelease:...}
m = re.search(r"major\s*:\s*0\s*,\s*minor\s*:\s*(\d+)\s*,\s*patch\s*:\s*(\d+)", text)
if m:
    info["rn_version"] = f"0.{m.group(1)}.{m.group(2)}"
else:  # Hermes keeps numbers out of the string table; native libs carry it sometimes
    for d, _, fs in os.walk(os.path.join(src, "lib")):
        for f in fs:
            mm = re.search(rb"react-native[/@ -]v?(0\.\d+\.\d+)", open(os.path.join(d, f), "rb").read())
            if mm:
                info["rn_version"] = mm.group(1).decode()
                break
if "rn_version" not in info:  # Java side: com.facebook.react.modules.systeminfo.ReactNativeVersion.<clinit> puts major/minor/patch
    try:
        from androguard.core.dex import DEX
        for f in sorted(os.listdir(src)):
            if not re.match(r"classes\d*\.dex$", f):
                continue
            dex = DEX(open(os.path.join(src, f), "rb").read())
            if b"prerelease" not in open(os.path.join(src, f), "rb").read():
                continue
            # the class may be renamed by R8, so look at every method that names major/minor/patch/prerelease
            for c in dex.get_classes():
                for meth in c.get_methods():
                    seq = []
                    try:
                        for ins in meth.get_instructions():
                            op, out_ = ins.get_name(), ins.get_output()
                            if op.startswith("const-string"):
                                seq.append(out_.split(",", 1)[1].strip().strip("'\""))
                            elif op.startswith("const/") or op == "const":
                                seq.append(int(out_.split(",")[-1].strip(), 0))
                    except Exception:
                        continue
                    if "minor" not in seq:
                        continue
                    if not c.get_name().endswith("ReactNativeVersion;") and "prerelease" not in seq:
                        continue
                    ints = [x for x in seq if isinstance(x, int)]
                    if "major" in seq and ints and "rn_version" not in info:
                        # Dalvik loads each distinct number once and reuses the register, so the list is the
                        # distinct values in any order: major is 0, minor is the big one, patch the rest (or 0)
                        minor = max(ints)
                        rest = [x for x in ints if x not in (0, minor)]
                        patch = rest[0] if rest else 0
                        k = seq.index("prerelease") if "prerelease" in seq else -1
                        pre = seq[k + 1] if 0 <= k < len(seq) - 1 and isinstance(seq[k + 1], str) else None
                        if 40 <= minor <= 200:
                            info["rn_version"] = f"0.{minor}.{patch}"
                            info["rn_prerelease"] = pre
                            info["rn_version_from"] = f"dex {c.get_name()}"
                    info.setdefault("debug_dex_seqs", []).append([c.get_name() + "->" + meth.get_name()] + seq[:30])
    except Exception as e:
        info["rn_version_error"] = str(e)[:200]
libs = sorted({f for _, _, fs in os.walk(os.path.join(src, "lib")) for f in fs})
m = re.search(r"registerComponent\(\s*[\"']([^\"']+)", text)
info["app_name"] = m.group(1) if m else None   # the host must launch this exact name
info["new_architecture"] = any(l in libs for l in ("libfabricjni.so", "libreact_newarchdefaults.so"))
info["engine_lib"] = "hermes" if any("hermes" in l for l in libs) else "jsc" if "libjsc.so" in libs else None

CORE = set("""AccessibilityInfo AccessibilityManager ActionSheetManager AlertManager AppState Appearance BlobModule
DeviceEventManager DeviceInfo DevSettings DialogManagerAndroid ExceptionsManager FileReaderModule FrameRateLogger
HeadlessJsTaskSupport I18nManager ImageLoader ImageEditor ImageStoreManager IntentAndroid JSCHeapCapture KeyboardObserver
LinkingManager LogBox Networking NativeAnimatedModule PermissionsAndroid PlatformConstants RedBox SettingsManager
ShareModule SoundManager SourceCode StatusBarManager Timing ToastAndroid UIManager Vibration WebSocketModule
DevLoadingView DevMenu HeapCapture JSDevSupport NativeAnimatedTurboModule ReactDevToolsSettingsManager
RCTView RCTText RCTScrollView RCTImageView RCTTextInput AndroidTextInput RCTModalHostView RCTSafeAreaView
AndroidSwitch RCTSwitch AndroidProgressBar ActivityIndicatorView AndroidHorizontalScrollView RCTRefreshControl
AndroidSwipeRefreshLayout AndroidDrawerLayout RCTVirtualText RCTSinglelineTextInputView RCTMultilineTextInputView
AndroidHorizontalScrollContentView DebuggingOverlay""".split())
asked = set(re.findall(r"NativeModules\.([A-Z][A-Za-z0-9_]+)", text))
asked |= set(re.findall(r"TurboModuleRegistry\.(?:getEnforcing|get)\(\s*['\"]([A-Za-z0-9_]+)", text))
asked |= set(re.findall(r"requireNativeComponent\(\s*['\"]([A-Za-z0-9_]+)", text))
asked |= set(re.findall(r"codegenNativeComponent\(\s*['\"]([A-Za-z0-9_]+)", text))
# minified bundles rename requireNativeComponent (r(d[3])("RNCSafeAreaProvider")): also take quoted native-looking names
asked |= set(re.findall(r"[\"'](RN[A-Z][A-Za-z0-9]{2,40}|RNC[A-Z][A-Za-z0-9]{2,40}|Expo[A-Z][A-Za-z0-9]{2,40}|LottieAnimationView)[\"']", text))
if hermes:  # bytecode: names sit in the string table; catch the common third-party prefixes
    asked |= set(re.findall(r"\b(RN[A-Z][A-Za-z0-9]{2,40}|RCT[A-Z][A-Za-z0-9]{2,40}|Expo[A-Z][A-Za-z0-9]{2,40})\b", text))
info["native_core"] = sorted(asked & CORE)
info["native_third_party"] = sorted(asked - CORE)

# images
regs = re.findall(r"__packager_asset\s*:\s*!0\s*,\s*httpServerLocation\s*:\s*\"([^\"]*)\"[^}]*?"
                  r"scales\s*:\s*\[([\d.,\s]*)\][^}]*?name\s*:\s*\"([^\"]+)\"\s*,\s*type\s*:\s*\"([^\"]+)\"", text)
if not regs:  # property order differs between versions: parse each registration object
    for obj in re.findall(r"\{[^{}]*__packager_asset[^{}]*\}", text):
        loc = re.search(r"httpServerLocation\s*:\s*\"([^\"]*)\"", obj)
        sc = re.search(r"scales\s*:\s*\[([\d.,\s]*)\]", obj)
        nm = re.search(r"name\s*:\s*\"([^\"]+)\"", obj)
        ty = re.search(r"type\s*:\s*\"([^\"]+)\"", obj)
        if loc and sc and nm and ty:
            regs.append((loc.group(1), sc.group(1), nm.group(1), ty.group(1)))
density = {0.75: "ldpi", 1: "mdpi", 1.5: "hdpi", 2: "xhdpi", 3: "xxhdpi", 4: "xxxhdpi"}
copied = missing = 0
for loc, scales, name, typ in regs:
    # React Native's own rule (assetPathUtils.getAndroidResourceIdentifier)
    android = (loc.lstrip("/") + "/" + name).lower().replace("/", "_")
    android = re.sub(r"[^a-z0-9_]", "", android)
    android = re.sub(r"^assets_", "", android)
    for sc in [float(x) for x in scales.split(",") if x.strip()]:
        dens = density.get(sc, "mdpi")
        found = None
        for folder in (f"drawable-{dens}", f"drawable-{dens}-v4", "drawable", "raw"):
            p = os.path.join(src, "res", folder, f"{android}.{typ}")
            if os.path.exists(p):
                found = p
                break
        if not found:
            for d, _, fs in os.walk(os.path.join(src, "res")):
                if f"{android}.{typ}" in fs and dens in d:
                    found = os.path.join(d, f"{android}.{typ}")
                    break
        # iOS looks next to main.jsbundle at <httpServerLocation without leading />/<name>@<scale>x.<type>
        suffix = "" if sc == 1 else f"@{sc:g}x"
        dest = os.path.normpath(os.path.join(out, "app", loc.lstrip("/"), f"{name}{suffix}.{typ}"))
        if found and dest.startswith(os.path.join(out, "app")):
            os.makedirs(os.path.dirname(dest), exist_ok=True)
            shutil.copy(found, dest)
            copied += 1
        else:
            missing += 1
info["images"] = {"registrations": len(regs), "copied": copied, "missing": missing}
# debug samples (kept short): where the version and image registrations sit in this bundle
info["debug_version_ctx"] = [text[max(0, m.start() - 120):m.end() + 60] for m in re.finditer(r"prerelease", text)][:3]
info["debug_fb_ctx"] = [text[max(0, m.start() - 300):m.end() + 300] for m in re.finditer(r"NATIVE_FIREBASE_APPS|No Firebase App", text)][:4]
info["debug_asset_ctx"] = [text[max(0, m.start() - 160):m.end() + 200] for m in re.finditer(r"__packager_asset", text)][:2]
# the biggest launcher icon (round ones last), for the iPhone home screen
icons = []
for root, _, files in os.walk(os.path.join(src, "res")):
    for f in files:
        if f.endswith(".png") and f.startswith("ic_launcher") and "foreground" not in f and "background" not in f:
            p = os.path.join(root, f); icons.append(("round" in f, -os.path.getsize(p), p))
if icons:
    shutil.copy(sorted(icons)[0][2], os.path.join(out, "icon.png")); info["icon"] = os.path.relpath(sorted(icons)[0][2], src)
# the app's own package name and home-screen name, for the iPhone app's bundle id and display name
try:
    from androguard.core.axml import AXMLPrinter, ARSCParser
    from lxml import etree
    man = etree.fromstring(AXMLPrinter(open(os.path.join(src, "AndroidManifest.xml"), "rb").read()).get_xml())
    A = "{http://schemas.android.com/apk/res/android}"
    info["package"] = man.get("package")
    lab = man.find("application").get(A + "label") or ""
    if lab.startswith("@"):
        arsc = ARSCParser(open(os.path.join(src, "resources.arsc"), "rb").read())
        rid = int(lab[1:].split(":")[-1], 16) if lab[1:2] != "s" else None
        if rid is not None:
            vals = arsc.get_resolved_res_configs(rid)
            lab = vals[0][1] if vals else ""
    if lab: info["label"] = lab
except Exception as x:
    info["label_error"] = str(x)[:200]
json.dump(info, open(os.path.join(out, "rn.json"), "w"), indent=1)
md = [f"- {k}: {v}" for k, v in info.items()]
open(os.path.join(out, "rn.md"), "w").write("\n".join(md) + "\n")
print("\n".join(md))
for k, v in info.items():
    if isinstance(v, (str, int, bool)):
        print(f"{k}={v}", file=open(os.path.join(out, "env"), "a"))

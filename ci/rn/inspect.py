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
    loc = loc.lstrip("/")
    base = (loc.replace("assets/", "", 1) if loc.startswith("assets/") else loc)
    android = re.sub(r"[^a-z0-9_]", "", (base.replace("/", "_") + "_" + name).lower()).lstrip("_")
    for sc in [float(x) for x in scales.split(",") if x.strip()]:
        dens = density.get(sc, "mdpi")
        found = None
        for folder in (f"drawable-{dens}", f"drawable-{dens}-v4", "drawable", "raw"):
            p = os.path.join(src, "res", folder, f"{android}.{typ}")
            if os.path.exists(p):
                found = p
                break
        if not found:  # aapt2 may have shortened res paths: look anywhere in res/ and assets/
            for d, _, fs in os.walk(src):
                if f"{android}.{typ}" in fs:
                    found = os.path.join(d, f"{android}.{typ}")
                    break
        suffix = "" if sc == 1 else f"@{sc:g}x"
        dest = os.path.join(out, "assets", loc, f"{name}{suffix}.{typ}")
        if found:
            os.makedirs(os.path.dirname(dest), exist_ok=True)
            shutil.copy(found, dest)
            copied += 1
        else:
            missing += 1
info["images"] = {"registrations": len(regs), "copied": copied, "missing": missing}
# debug samples (kept short): where the version and image registrations sit in this bundle
info["debug_version_ctx"] = [text[max(0, m.start() - 120):m.end() + 60] for m in re.finditer(r"prerelease", text)][:3]
info["debug_asset_ctx"] = [text[max(0, m.start() - 160):m.end() + 200] for m in re.finditer(r"__packager_asset", text)][:2]
json.dump(info, open(os.path.join(out, "rn.json"), "w"), indent=1)
md = [f"- {k}: {v}" for k, v in info.items()]
open(os.path.join(out, "rn.md"), "w").write("\n".join(md) + "\n")
print("\n".join(md))
for k, v in info.items():
    if isinstance(v, (str, int, bool)):
        print(f"{k}={v}", file=open(os.path.join(out, "env"), "a"))

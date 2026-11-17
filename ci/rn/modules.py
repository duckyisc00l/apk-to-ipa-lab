"""Native add-on modules a React Native bundle asks for -> npm packages at versions from the same era.

Usage (on a runner with npm): python3 -I modules.py <rn.json from inspect.py> <host dir>
Prints the npm install line and writes <host>/addons.json.
Rule for versions (same idea as Unity packages): the newest release of each package published before the
NEXT React Native minor came out, so it was built against this React Native.
Left out on purpose: debug tools (Flipper), and Google/Firebase/crash-reporting/ads modules: the skill removes
those, and they crash at start without the original developer's config files. Calls into them are stubbed in JS.
"""
import json, os, re, subprocess, sys
from datetime import datetime

KNOWN = {  # native module / component name -> npm package
    "RNGestureHandlerModule": "react-native-gesture-handler", "RNGestureHandlerButton": "react-native-gesture-handler",
    "RNVectorIconsManager": "react-native-vector-icons", "RNVectorIconsModule": "react-native-vector-icons",
    "RNInAppBrowser": "react-native-inappbrowser-reborn", "RNReactNativeHapticFeedback": "react-native-haptic-feedback",
    "SplashScreen": "react-native-splash-screen", "RNCAsyncStorage": "@react-native-async-storage/async-storage",
    "AsyncSQLiteDBStorage": "@react-native-async-storage/async-storage", "RNCSafeAreaView": "react-native-safe-area-context",
    "RNCSafeAreaProvider": "react-native-safe-area-context", "RNCSafeAreaContext": "react-native-safe-area-context",
    "RNSScreen": "react-native-screens", "RNSScreenStack": "react-native-screens", "RNSScreenContainer": "react-native-screens",
    "RNSVGSvgView": "react-native-svg", "RNSVGPath": "react-native-svg", "RNCWebView": "react-native-webview",
    "ReanimatedModule": "react-native-reanimated", "RNDeviceInfo": "react-native-device-info",
    "RNCNetInfo": "@react-native-community/netinfo", "RNCClipboard": "@react-native-clipboard/clipboard",
    "RNCPicker": "@react-native-picker/picker", "RNCSlider": "@react-native-community/slider",
    "BVLinearGradient": "react-native-linear-gradient", "RNSound": "react-native-sound", "RNFSManager": "react-native-fs",
    "RNCMaskedView": "@react-native-masked-view/masked-view", "LottieAnimationView": "lottie-react-native",
    "RNShare": "react-native-share", "RNLocalize": "react-native-localize", "RNKeychainManager": "react-native-keychain",
    "RNCDatePicker": "@react-native-community/datetimepicker", "RNVideo": "react-native-video", "RCTVideo": "react-native-video",
    "RNImagePicker": "react-native-image-picker", "RNPermissions": "react-native-permissions",
    "RNReanimated": "react-native-reanimated", "SQLite": "react-native-sqlite-storage",
}
# Hermes bundles keep strings in one run-together table, so short module names ("SQLite") can't be matched alone:
# these packages are added when their npm name is in the bundle (error messages and paths carry it)
BY_NAME = ["react-native-sqlite-storage", "react-native-reanimated", "react-native-gesture-handler"]
# the bundle's JS half must match the native half's major version: signs that pin an older major
MAJOR_SIGNS = {"react-native-reanimated": [("AnimatedMainClock", 2)]}  # Reanimated 1 API: only 2.x still has it
SKIP = re.compile(r"^(Flipper|RNFB|Bugsnag|RNSentry|Sentry|RNGoogle|GoogleSignin|RNAdMob|RNFirebase|Crashlytics|"
                  r"Amplitude|Mixpanel|AppCenter|CodePush|RNBranch|Adjust|AppsFlyer|FBSDK|RNIap|RNPlayInstall)", re.I)


def npm_json(*args):
    r = subprocess.run(["npm", "view", *args, "--json"], capture_output=True, text=True)
    try:
        return json.loads(r.stdout)
    except ValueError:
        return None


def date(s):
    return datetime.fromisoformat(s.replace("Z", "+00:00"))


def main():
    info = json.load(open(sys.argv[1]))
    host = sys.argv[2]
    rn = info.get("rn_version") or "0.0.0"
    minor = int(rn.split(".")[1])
    rn_times = npm_json("react-native", "time") or {}
    nxt = [v for v in rn_times if re.fullmatch(rf"0\.{minor + 1}\.0", v)]
    cutoff = date(rn_times[nxt[0]]) if nxt else datetime.now().astimezone()
    text = open(sys.argv[3], "rb").read().decode("latin-1") if len(sys.argv) > 3 else ""
    picked, skipped, unknown = {}, [], []
    names = list(info.get("native_third_party", []))
    for pkg in BY_NAME:
        if pkg in text:
            names.append(next(k for k, v in KNOWN.items() if v == pkg))
    for name in names:
        if SKIP.match(name):
            skipped.append(name)
            continue
        pkg = KNOWN.get(name)
        if not pkg:
            unknown.append(name)
            continue
        if pkg in picked:
            continue
        times = npm_json(pkg, "time") or {}
        major = next((m for sign, m in MAJOR_SIGNS.get(pkg, []) if sign in text), None)
        ok = sorted((date(t), v) for v, t in times.items()
                    if re.fullmatch(r"\d+\.\d+\.\d+", v) and date(t) < cutoff
                    and (major is None or v.split(".")[0] == str(major)))
        if ok:
            picked[pkg] = ok[-1][1]
    out = {"rn": rn, "cutoff": cutoff.isoformat(), "install": picked, "skipped_removed": skipped, "unknown": unknown}
    json.dump(out, open(os.path.join(host, "addons.json"), "w"), indent=1)
    print(json.dumps(out, indent=1))
    print("INSTALL=" + " ".join(f"{p}@{v}" for p, v in picked.items()))
    print("STUB=" + " ".join(skipped + unknown))


if __name__ == "__main__":
    main()

"""Skill step 1 + U1 on every downloaded app: unpack bundles, find the engine (with variant,
evidence and the skill's route), Mono vs IL2CPP, Unity version, script count, protection flags.
Writes out/detect.md and out/detect.json. classify(root) works on any unpacked folder.

Usage: python3 ci/detect.py dl work
"""
import json, os, re, struct, sys, zipfile

VER = re.compile(rb"(20[1-9][0-9]|6000)\.[0-9]+\.[0-9]+[abfp][0-9]+")


def merge(path, dest):
    """Unpack any package format with ci/unpack.py, then flatten its merged all/ folder into dest."""
    import subprocess, shutil
    tmp = dest + "_unpack"
    r = subprocess.run([sys.executable, "-I", os.path.join(os.path.dirname(os.path.abspath(__file__)), "unpack.py"), path, tmp],
                       capture_output=True, text=True)
    try:
        rep = json.loads(r.stdout)
    except ValueError:
        return [f"unpack failed: {r.stderr.strip()[-300:]}"]
    if os.path.isdir(os.path.join(tmp, "all")):
        shutil.copytree(os.path.join(tmp, "all"), dest, dirs_exist_ok=True)
    if os.path.exists(os.path.join(tmp, "base.apk")):
        shutil.copy(os.path.join(tmp, "base.apk"), dest + ".base.apk")
    shutil.rmtree(tmp, ignore_errors=True)
    notes = rep.get("notes", []) or [f"{len(rep.get('apks', []))} APK(s)"]
    return notes + [f"PROTECTED/ENCRYPTED: {w}" for w in rep.get("protected_or_encrypted", [])]


def unity_version(root):
    cands = []
    for sub in ("assets/bin/Data/globalgamemanagers", "assets/bin/Data/data.unity3d",
                "assets/bin/Data/unity default resources"):
        p = os.path.join(root, sub)
        if os.path.exists(p):
            cands.append(p)
    for d, _, fs in os.walk(os.path.join(root, "lib")):
        cands += [os.path.join(d, f) for f in fs if f == "libunity.so"]
    for p in cands:
        with open(p, "rb") as f:
            m = VER.search(f.read(64 * 1024 * 1024))
        if m:
            return m.group(0).decode(), os.path.relpath(p, root)
    return None, None


ROUTES = {  # engine id -> (route kind, skill step, what to do); kinds follow the skill's order: run unchanged, re-export, rewrite
    "web-cordova": ("run unchanged", "2-5", "web folder assets/www in a Swift web view"),
    "web-capacitor": ("run unchanged", "2-5", "web folder assets/public in a Swift web view"),
    "web-html5": ("run unchanged", "2-5", "HTML5 export in a Swift web view"),
    "gamemaker": ("run unchanged", "G", "game.droid on an open-source GameMaker runner"),
    "gm8": ("run unchanged", "G", "GameMaker 8 data (runs through an emulator on Android)"),
    "unity-mono": ("re-export", "U", "recover the project (AssetRipper) and build it for iOS with the same Unity"),
    "unity-il2cpp": ("re-export", "U6", "recover assets and scenes; the C# logic is rewritten"),
    "unity": ("re-export", "U", "recover the project and build it for iOS"),
    "unreal": ("rewrite", "X", "rebuild in Godot with the game's own assets"),
    "godot": ("re-export", "E", "GDRE Tools recovers the project; export with the same Godot for iOS"),
    "renpy": ("run unchanged", "E", "game/ files on Ren'Py's iOS build (renios)"),
    "love": ("run unchanged", "E", "game.love on LOVE's iOS build"),
    "rn": ("run unchanged", "E", "the JS bundle on an iPhone host app of the same React Native version"),
    "flutter": ("re-export", "E", "build from source if open source; else rewrite (step R) with flutter_assets"),
    "xamarin": ("re-export", "E", "recover the C# (ILSpy); shared screens rebuild for iOS, Android-only screens are the spec for step R"),
    "cocos2dx": ("run unchanged", "E", "readable scripts on the engine's iOS build; compiled-in C++ games are rewritten"),
    "cocos-creator": ("run unchanged", "E", "the JS game on Cocos' iOS build or a web build; encrypted .jsc means rewrite"),
    "libgdx": ("rewrite", "R", "decompiled Java is the spec; art and sound drop in (open source: libGDX's iOS backend)"),
    "defold": ("run unchanged", "E", "game.arcd/arci/dmanifest/projectc on the same Defold version's iOS engine (untested)"),
    "solar2d": ("run unchanged", "E", "resource.car (compiled Lua) on Solar2D's iOS template of the same build (untested)"),
    "kivy": ("run unchanged", "E", "the app's Python files on kivy-ios (untested)"),
    "python": ("rewrite", "R", "Python app without Kivy: rewrite with its code as the spec"),
    "qt": ("re-export", "E", "build from source with Qt for iOS if open source; else rewrite (step R)"),
    "nativescript": ("re-export", "E", "build from source for iOS if open source; else its JS (assets/app) is the spec for step R"),
    "haxe": ("re-export", "E", "OpenFL/Lime: build from source for iOS if open source; else rewrite"),
    "gomobile": ("rewrite", "R", "Go code compiled in; rewrite"),
    "native-cpp": ("rewrite", "R", "own C/C++ engine compiled in; rewrite with its assets (open source: build its iOS port)"),
    "native-compose": ("rewrite", "R", "Kotlin + Jetpack Compose: rewrite in SwiftUI"),
    "native": ("rewrite", "R", "Java/Kotlin app: rewrite in SwiftUI"),
}
HELPER_LIBS = re.compile(r"^lib(c\+\+_shared|androidx|datastore_shared_counter|sqlcipher|realm|conscrypt|mmkv|tensorflowlite|jnidispatch|"
                         r"sentry|bugsnag|crashlytics|barhopper|imagepipeline|native-|gifimage|static-webp|zstd|sodium|sqlite|"
                         r"av(codec|format|util|filter|device)|sw(scale|resample)|ffmpeg|vlc|mpv|opencv|tesseract|lept|"
                         r"pl_droidsonroids|rive|lottie|yuv|jpeg|png|webp|crypto|ssl|curl|z\.so|icu|xamarin|onnx|mlkit|"
                         r"face|ocr|graphics-core|surface_util|filament|gojni|rust|uniffi)", re.I)


def _read(path, n=None):
    try:
        with open(path, "rb") as f:
            return f.read(n) if n else f.read()
    except OSError:
        return b""


def _web_engine(root, webdir, files):
    """Name the HTML5 engine or framework inside a web folder."""
    rel = [f[len(webdir) + 1:] for f in files if f.startswith(webdir + "/")]
    low = [f.lower() for f in rel]
    tags = []
    if any("c3runtime" in f or f.endswith("c3main.js") for f in low):
        tags.append("construct3")
    elif any(f.endswith("c2runtime.js") for f in low):
        tags.append("construct2")
    if any(f.endswith(("js/rmmz_core.js", "js/rmmz_core.min.js")) for f in low):
        tags.append("rpgmaker-mz")
    elif any(f.endswith("js/rpg_core.js") for f in low):
        tags.append("rpgmaker-mv")
    if any(f.startswith("cocos-js/") or "cocos2d-js" in f for f in low) or ("src/settings.js" in low and "main.js" in low):
        tags.append("cocos-web")
    blob = _read(os.path.join(root, webdir, "index.html"), 200000)
    js = sorted((f for f in rel if f.endswith(".js")), key=lambda f: -os.path.getsize(os.path.join(root, webdir, f)))[:12]
    for f in js:
        blob += _read(os.path.join(root, webdir, f), 6 * 1024 * 1024)
    if not tags:
        if b"gdjs.RuntimeGame" in blob or b"gdjs.runtimeGame" in blob or any(f.startswith(("gdjs", "pixi-renderers/")) for f in low):
            tags.append("gdevelop")
        elif b"Phaser.Game" in blob or b"Phaser v" in blob or any("phaser" in f for f in low):
            tags.append("phaser")
        elif b"PIXI.Application" in blob or b"pixi.js" in blob:
            tags.append("pixi")
    if b"ion-app" in blob or b"@ionic/core" in blob or b"IonicModule" in blob:
        tags.append("ionic")
    return tags


def classify(root):
    libs = set()
    for d, _, fs in os.walk(os.path.join(root, "lib")):
        libs.update(fs)
    has = lambda rel: os.path.exists(os.path.join(root, rel))  # noqa: E731
    files = [os.path.relpath(os.path.join(d, f), root).replace(os.sep, "/") for d, _, fs in os.walk(root) for f in fs]
    r = {"libs": sorted(libs)}
    ev = []                     # evidence: the files that decided it
    tags = []                   # engine id first, then variants (suite matches on these)
    lib = lambda *names: [l for l in libs if l in names]  # noqa: E731
    libre = lambda pat: sorted(l for l in libs if re.search(pat, l))  # noqa: E731
    dex = b""
    for f in files:
        if re.match(r"classes\d*\.dex$", f):
            dex += _read(os.path.join(root, f))
    manifest = _read(os.path.join(root, "AndroidManifest.xml"))
    in_manifest = lambda s: s.encode() in manifest or s.encode("utf-16-le") in manifest  # noqa: E731

    def python_payload():
        """Names inside python-for-android's bundles (private.tar / libpybundle.so / private.mp3)."""
        import tarfile
        names = []
        for f in files:
            b = os.path.basename(f)
            if b in ("private.tar", "private.mp3", "libpybundle.so", "private.zip") or f.endswith("/private.tar"):
                p = os.path.join(root, f)
                try:
                    with tarfile.open(p) as t:
                        names += t.getnames()[:20000]
                except (tarfile.TarError, OSError, EOFError):
                    try:
                        with zipfile.ZipFile(p) as z:
                            names += z.namelist()[:20000]
                    except (zipfile.BadZipFile, OSError):
                        pass
        return names

    if "libunity.so" in libs:
        r["engine"] = "Unity"
        managed = os.path.join(root, "assets/bin/Data/Managed")
        dlls = sorted(f for f in os.listdir(managed) if f.endswith(".dll")) if os.path.isdir(managed) else []
        # The scripting runtime decides it, not Assembly-CSharp.dll: projects that use
        # assembly definitions ship their code in their own DLL names, and compressed
        # builds keep the DLLs inside data.unity3d.
        if "libmonobdwgc-2.0.so" in libs or "libmono.so" in libs:
            r["backend"] = "Mono"
        elif "libil2cpp.so" in libs or has("assets/bin/Data/Managed/Metadata/global-metadata.dat"):
            r["backend"] = "IL2CPP"
        else:
            r["backend"] = "unknown"
        unity_dlls = re.compile(r"^(Unity|UnityEngine|UnityEditor|System|mscorlib|Mono\.|netstandard|Microsoft\.|nunit)")
        r["game_dlls"] = [d for d in dlls if not unity_dlls.match(d)]
        r["dlls_where"] = "Managed/" if dlls else ("inside data.unity3d" if has("assets/bin/Data/data.unity3d") else "not found")
        r["unity_version"], r["version_from"] = unity_version(root)
        r["data_unity3d"] = has("assets/bin/Data/data.unity3d")
        tags = ["unity", {"Mono": "unity-mono", "IL2CPP": "unity-il2cpp"}.get(r["backend"], "unity")]
        ev = ["libunity.so"] + lib("libmonobdwgc-2.0.so", "libmono.so", "libil2cpp.so")
        r["variant"] = f"{r['backend']} {r['unity_version'] or ''}".strip()
    elif "libyoyo.so" in libs:
        r["engine"] = "GameMaker"
        tags, ev = ["gamemaker"], ["libyoyo.so"] + [f for f in files if f.endswith(("game.droid", "data.win"))][:1]
    elif "libgm8emulator.so" in libs:
        r["engine"] = "GameMaker 8 (through an emulator)"
        tags, ev = ["gm8", "gamemaker"], ["libgm8emulator.so"]
    elif libs & {"libUE4.so", "libUnreal.so"}:
        r["engine"] = "Unreal"
        tags, ev = ["unreal", "ue4" if "libUE4.so" in libs else "ue5"], lib("libUE4.so", "libUnreal.so")
        r["variant"] = "UE4" if "libUE4.so" in libs else "UE5 (libUnreal.so)"
    elif any(l.startswith("libgodot") for l in libs):
        r["engine"] = "Godot"
        gl = libre(r"^libgodot")
        m = None
        for l in gl:
            for d, _, fs in os.walk(os.path.join(root, "lib")):
                if l in fs:
                    m = m or re.search(rb"\b([34])\.(\d+)(?:\.(\d+))?\.(stable|rc\d*|beta\d*|dev\d*)", _read(os.path.join(d, l)))
        major = m.group(1).decode() if m else None
        if not major:  # from the project files: Godot 4 keeps a .godot/ folder, Godot 3 a .import/ folder
            major = "4" if any(f.startswith("assets/.godot/") for f in files) else "3" if any(f.startswith("assets/.import/") for f in files) else None
        r["godot_version"] = m.group(0).decode() if m else major
        r["variant"] = f"Godot {r['godot_version'] or '?'}" + (" C#" if libre(r"monosgen|mono-native") or any(f.endswith(".dll") for f in files) else "")
        tags, ev = ["godot"] + ([f"godot{major}"] if major else []), gl + ([f"version {m.group(0).decode()}"] if m else [])
    elif "liblove.so" in libs:
        r["engine"] = "LOVE"
        tags, ev = ["love"], ["liblove.so"] + [f for f in files if f.endswith("game.love")][:1]
    elif "librenpython.so" in libs or (libre(r"^libpymodules|^libpython|^libpybundle") and (
            any("/x-game/" in f or "/x-renpy/" in f or f.endswith((".rpa", ".rpyc")) for f in files)
            or any(n.startswith(("renpy/", "./renpy/")) for n in python_payload()))):
        r["engine"] = "Ren'Py"
        old = "librenpython.so" not in libs
        sv = [f for f in files if f.endswith("script_version.txt")]
        r["renpy_version"] = _read(os.path.join(root, sv[0]), 64).decode("utf-8", "replace").strip() if sv else None
        r["variant"] = ("old (libpython2.7 + libpymodules)" if old else "new (librenpython)") + (f" {r['renpy_version']}" if r["renpy_version"] else "")
        tags = ["renpy", "renpy-old" if old else "renpy-new"]
        ev = lib("librenpython.so", "libpymodules.so", "libpython2.7.so") + sv[:1]
    elif "libflutter.so" in libs:
        r["engine"] = "Flutter"
        tags, ev = ["flutter"], lib("libflutter.so", "libapp.so")
    elif libre(r"^libNativeScript") or has("assets/app/package.json") and b"Lcom/tns/" in dex:
        r["engine"] = "NativeScript"
        tags, ev = ["nativescript"], libre(r"^libNativeScript") + [f for f in files if f.startswith("assets/app/")][:1]
    elif (lib("libhermes.so", "libjsc.so", "libreactnativejni.so", "libreactnative.so", "libhermesvm.so", "libhermes_executor.so")
          or has("assets/index.android.bundle")):
        r["engine"] = "React Native"
        bundle = os.path.join(root, "assets/index.android.bundle")
        hermes = _read(bundle, 8) == bytes.fromhex("c61fbc03c103191f")
        expo = bool(libre(r"^libexpo") or has("assets/app.config") or has("assets/app.manifest") or b"Lexpo/modules/" in dex)
        tags = ["rn", "rn-hermes" if hermes else ("rn-plain" if os.path.exists(bundle) else "rn-nobundle")] + (["expo"] if expo else [])
        r["variant"] = ("Hermes bytecode" if hermes else "plain JS" if os.path.exists(bundle) else "no bundle in APK") + (", Expo" if expo else "")
        ev = lib("libhermes.so", "libhermesvm.so", "libjsc.so", "libreactnativejni.so", "libreactnative.so") + \
            (["assets/index.android.bundle"] if os.path.exists(bundle) else []) + (libre(r"^libexpo")[:1] or (["Expo markers"] if expo else []))
        m = re.search(rb"major:(\d+),minor:(\d+),patch:(\d+)", _read(bundle, 40 * 1024 * 1024)) if not hermes else None
        r["rn_version"] = ".".join(x.decode() for x in m.groups()) if m else None
    elif any(l in libs for l in ("libgdx.so",)):
        r["engine"] = "libGDX"
        tags, ev = ["libgdx"], ["libgdx.so"]
    elif any(l in libs for l in ("libmonodroid.so", "libxamarin-app.so")) or libre(r"^libassemblies\..*\.blob\.so$"):
        r["engine"] = "Xamarin/.NET"
        names = " ".join(files)
        blob = b"".join(_read(os.path.join(root, f), 64 * 1024 * 1024) for f in files
                        if re.search(r"assemblies.*\.blob(\.so)?$|assemblies\.manifest$", f))
        def dotnet(name):
            return name in names or name.encode() in blob or name.encode("utf-16-le") in blob
        kind = "MAUI" if dotnet("Microsoft.Maui") else "Xamarin.Forms" if dotnet("Xamarin.Forms") else \
            "Avalonia" if dotnet("Avalonia") else "Uno" if dotnet("Uno.UI") else "MonoGame" if dotnet("MonoGame.Framework") else \
            ".NET Android (screens Android-only)"
        r["variant"] = kind
        tags = ["xamarin", {"MAUI": "maui", "Xamarin.Forms": "xamarin-forms"}.get(kind, "dotnet-android")]
        ev = lib("libmonodroid.so", "libxamarin-app.so", "libmonosgen-2.0.so") + libre(r"^libassemblies")[:1]
    elif libre(r"^libcocos") or "libcocos2djs.so" in libs:
        r["engine"] = "Cocos2d-x"
        cl = libre(r"^libcocos")
        lua = any(f.endswith((".lua", ".luac")) for f in files) or "libcocos2dlua.so" in libs
        creator = any(f.startswith(("assets/jsb-adapter", "assets/data/", "assets/assets/")) or f in ("assets/main.js", "assets/application.js") for f in files) \
            or "libcocos.so" in libs
        js = "libcocos2djs.so" in libs or any(f.endswith((".jsc",)) for f in files) or has("assets/main.js")
        if creator and not lua:
            tags = ["cocos-creator", "cocos"]
            r["variant"] = "Cocos Creator (JS)"
        elif lua:
            tags, r["variant"] = ["cocos2dx", "cocos", "cocos-lua"], "Lua"
        elif js:
            tags, r["variant"] = ["cocos2dx", "cocos", "cocos-js"], "JS"
        else:
            tags, r["variant"] = ["cocos2dx", "cocos", "cocos-cpp"], "C++ (game compiled in)"
        ev = cl
    elif has("assets/capacitor.config.json"):   # check before Cordova: Capacitor apps also ship cordova.js
        r["engine"] = "Web (Capacitor)"
        sub = _web_engine(root, "assets/public", files)
        tags, ev = ["web-capacitor", "web"] + sub, ["assets/capacitor.config.json"]
        r["variant"] = " ".join(sub)
    elif has("assets/www/index.html"):
        r["engine"] = "Web (Cordova)"
        sub = _web_engine(root, "assets/www", files)
        tags, ev = ["web-cordova", "web"] + sub, ["assets/www/index.html"] + (["assets/www/cordova.js"] if has("assets/www/cordova.js") else [])
        r["variant"] = " ".join(sub)
    elif any(f in ("assets/game.arcd", "assets/game.projectc") for f in files) or b"Lcom/dynamo/android/" in dex:
        r["engine"] = "Defold"
        tags, ev = ["defold"], [f for f in files if f.startswith("assets/game.")][:3] or ["com.dynamo.android in dex"]
    elif "libcorona.so" in libs or has("assets/resource.car"):
        r["engine"] = "Solar2D (Corona)"
        tags, ev = ["solar2d"], lib("libcorona.so") + (["assets/resource.car"] if has("assets/resource.car") else [])
    elif libre(r"^libQt[56]?Core") or any(f.startswith("assets/--Added-by-androiddeployqt--") for f in files):
        r["engine"] = "Qt"
        major = "6" if libre(r"^libQt6") else "5"
        quick = bool(libre(r"^libQt[56]?Quick"))
        r["variant"] = f"Qt {major} " + ("Quick/QML" if quick else "Widgets")
        tags, ev = ["qt", f"qt{major}"], libre(r"^libQt[56]?(Core|Quick|Widgets)")[:3]
    elif libre(r"^libpython3|^libpython2|^libpybundle|^libpymodules") or any(os.path.basename(f) == "private.tar" for f in files) \
            or "libchaquopy_java.so" in libs:
        names = python_payload()
        kivy = any("/kivy/" in "/" + n or n.startswith("kivy") for n in names)
        if kivy:
            r["engine"] = "Kivy (Python)"
            tags = ["kivy", "python"]
        else:
            r["engine"] = "Python (" + ("Chaquopy/BeeWare" if "libchaquopy_java.so" in libs else "python-for-android, no Kivy") + ")"
            tags = ["python"] + (["chaquopy"] if "libchaquopy_java.so" in libs else [])
        ev = libre(r"^libpython|^libpybundle|^libmain\.so|^libSDL2|^libchaquopy")[:4] + (["kivy/ in the Python bundle"] if kivy else [])
    elif libre(r"^liblime|^libApplicationMain"):
        r["engine"] = "Haxe (OpenFL/Lime)"
        tags, ev = ["haxe"], libre(r"^liblime|^libApplicationMain")
    elif "libgojni.so" in libs:
        r["engine"] = "Go (gomobile)"
        tags, ev = ["gomobile"], ["libgojni.so"]
    else:
        # Own C/C++ engine, or Java/Kotlin with helper libraries? Look for a library that draws (GL/Vulkan)
        # and is the app's entry point or most of its native code.
        sizes = {}
        for d, _, fs in os.walk(os.path.join(root, "lib")):
            for f in fs:
                sizes[f] = max(sizes.get(f, 0), os.path.getsize(os.path.join(d, f)))
        own = [l for l in sizes if not HELPER_LIBS.match(l)]
        total = sum(sizes.values()) or 1
        native_act = in_manifest("android.app.NativeActivity") or in_manifest("android.app.lib_name") or in_manifest("GameActivity")
        engine_lib = None
        for l in sorted(own, key=lambda x: -sizes[x]):
            if sizes[l] < 300 * 1024:
                break
            for d, _, fs in os.walk(os.path.join(root, "lib")):
                if l in fs:
                    data = _read(os.path.join(d, l))
                    break
            draws = any(s in data for s in (b"glDrawElements", b"glDrawArrays", b"vkQueuePresentKHR", b"eglSwapBuffers"))
            entry = any(s in data for s in (b"ANativeActivity_onCreate", b"android_main", b"SDL_main", b"GameActivity_onCreate"))
            if draws and (entry or native_act or sizes[l] > 0.5 * total and sizes[l] > 2 * 1024 * 1024):
                engine_lib = l
                break
        compose = any(f.startswith("META-INF/androidx.compose.") for f in files) or b"Landroidx/compose/runtime/" in dex
        kotlin = any(f.endswith(".kotlin_module") or f.startswith("kotlin/") for f in files) or b"Lkotlin/" in dex
        if engine_lib:
            r["engine"] = "native C/C++ (own engine)"
            tags = ["native-cpp"] + (["sdl"] if "libSDL2.so" in libs else [])
            ev = [engine_lib] + (["NativeActivity in manifest"] if native_act else [])
        else:
            r["engine"] = "native (Java/Kotlin only)"
            tags = (["native-compose", "native", "compose"] if compose else ["native"]) + (["kotlin"] if kotlin else ["java"])
            r["variant"] = ("Kotlin" if kotlin else "Java") + (" + Jetpack Compose" if compose else " (Views)") + \
                (f", helper libs: {' '.join(sorted(sizes)[:6])}" if sizes else "")
            ev = (["META-INF/androidx.compose.*" if any(f.startswith("META-INF/androidx.compose.") for f in files) else "androidx/compose in dex"] if compose else []) + \
                (["Kotlin"] if kotlin else [])
    # HTML5 export loaded by the app's own web view (no Cordova/Capacitor), e.g. RPG Maker or Construct wrappers
    if tags and tags[0] in ("native", "native-compose"):
        idx = sorted((f for f in files if f.startswith("assets/") and f.endswith("/index.html")), key=lambda f: f.count("/"))
        for i in idx[:3]:
            webdir = os.path.dirname(i)
            sub = _web_engine(root, webdir, files)
            if sub and not set(sub) <= {"ionic"}:
                r["engine"] = "Web (own web view)"
                tags, ev, r["variant"] = ["web-html5", "web"] + sub, [i], " ".join(sub)
                break
    r["engine_id"] = tags[0] if tags else "unknown"
    r["tags"] = tags
    r["evidence"] = [e for e in ev if e]
    kind, step, what = ROUTES.get(r["engine_id"], ("rewrite", "R", "unknown engine: search for a runner first"))
    if r["engine_id"] == "rn" and "rn-hermes" in tags:
        what += " (Hermes: the host must use the exact matching Hermes version)"
    if r["engine_id"] in ("cocos2dx",) and "cocos-cpp" in tags:
        kind, step, what = "rewrite", "R", "C++ game compiled into the engine library: rewrite with its assets"
    if r["engine_id"] == "xamarin" and r.get("variant", "").startswith(".NET Android"):
        kind, what = "rewrite", "Android-only screens: the recovered C# (ILSpy) is the exact spec for step R"
    r["route"] = {"kind": kind, "step": step, "what": what}
    libdir = os.path.join(root, "lib")
    r["arches"] = sorted(os.listdir(libdir)) if os.path.isdir(libdir) else []
    r["arm64"] = "arm64-v8a" in r["arches"]
    return r


def protection(root):
    """ci/protect.py's levelled list (packed / encrypted / integrity) for an unpacked folder."""
    import importlib.util
    spec = importlib.util.spec_from_file_location("protect", os.path.join(os.path.dirname(os.path.abspath(__file__)), "protect.py"))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod.scan(root)


def main(dl, work):
    out = []
    md = ["# Detect", "", "| game | file | unpack | engine | backend | Unity | arches | game DLLs | variant | route | protection |",
          "|---|---|---|---|---|---|---|---|---|---|---|"]
    for game in sorted(os.listdir(dl)):
        for f in sorted(os.listdir(os.path.join(dl, game))):
            path = os.path.join(dl, game, f)
            root = os.path.join(work, game)
            notes = merge(path, root)
            r = classify(root)
            r.update(game=game, file=f, notes=notes, root=root, protection=protection(root))
            out.append(r)
            md.append(f"| {game} | {f} | {'; '.join(notes)} | {r['engine']} | {r.get('backend','')} | "
                      f"{r.get('unity_version') or ''} | {' '.join(r['arches'])} | "
                      f"{' '.join(r.get('game_dlls', [])) or r.get('dlls_where', '')} | {r.get('variant', '')} | "
                      f"{r['route']['kind']} (step {r['route']['step']}) | "
                      f"{'; '.join(x['level'] + ': ' + x['name'] for x in r['protection']) or 'none'} |")
    os.makedirs("out", exist_ok=True)
    json.dump(out, open("out/detect.json", "w"), indent=1)
    open("out/detect.md", "w").write("\n".join(md) + "\n")
    print("\n".join(md))


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])

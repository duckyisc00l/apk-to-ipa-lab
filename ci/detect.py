"""Skill step 1 + U1 on every downloaded app: unpack bundles, find the engine,
Mono vs IL2CPP, Unity version, script count. Writes out/detect.md and out/detect.json.

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


def classify(root):
    libs = set()
    for d, _, fs in os.walk(os.path.join(root, "lib")):
        libs.update(fs)
    has = lambda rel: os.path.exists(os.path.join(root, rel))  # noqa: E731
    r = {"libs": sorted(libs)}
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
    elif "libyoyo.so" in libs:
        r["engine"] = "GameMaker"
    elif "libgm8emulator.so" in libs:
        r["engine"] = "GameMaker 8 (through an emulator)"
    elif libs & {"libUE4.so", "libUnreal.so"}:
        r["engine"] = "Unreal"
    elif any(l.startswith("libgodot") for l in libs):
        r["engine"] = "Godot"
    elif "liblove.so" in libs:
        r["engine"] = "LOVE"
    elif "librenpython.so" in libs or {"libpymodules.so", "libpython2.7.so"} <= libs:
        r["engine"] = "Ren'Py"
    elif "libflutter.so" in libs:
        r["engine"] = "Flutter"
    elif any(l in libs for l in ("libhermes.so", "libjsc.so", "libreactnativejni.so")) or has("assets/index.android.bundle"):
        r["engine"] = "React Native"
    elif any(l in libs for l in ("libgdx.so",)):
        r["engine"] = "libGDX"
    elif any(l in libs for l in ("libmonodroid.so", "libxamarin-app.so")):
        r["engine"] = "Xamarin/.NET"
    elif any(l.startswith("libcocos") for l in libs):
        r["engine"] = "Cocos2d-x"
    elif has("assets/capacitor.config.json"):   # check before Cordova: Capacitor apps also ship cordova.js
        r["engine"] = "Web (Capacitor)"
    elif has("assets/www/index.html"):
        r["engine"] = "Web (Cordova)"
    elif libs - {"libc++_shared.so", "libandroidx.graphics.path.so", "libdatastore_shared_counter.so"}:
        r["engine"] = "native C/C++ (own engine)"
    else:
        r["engine"] = "native (Java/Kotlin only)"
    libdir = os.path.join(root, "lib")
    r["arches"] = sorted(os.listdir(libdir)) if os.path.isdir(libdir) else []
    r["arm64"] = "arm64-v8a" in r["arches"]
    return r


def main(dl, work):
    out = []
    md = ["# Detect", "", "| game | file | unpack | engine | backend | Unity | arches | game DLLs |", "|---|---|---|---|---|---|---|---|"]
    for game in sorted(os.listdir(dl)):
        for f in sorted(os.listdir(os.path.join(dl, game))):
            path = os.path.join(dl, game, f)
            root = os.path.join(work, game)
            notes = merge(path, root)
            r = classify(root)
            r.update(game=game, file=f, notes=notes, root=root)
            out.append(r)
            md.append(f"| {game} | {f} | {'; '.join(notes)} | {r['engine']} | {r.get('backend','')} | "
                      f"{r.get('unity_version') or ''} | {' '.join(r['arches'])} | "
                      f"{' '.join(r.get('game_dlls', [])) or r.get('dlls_where', '')} |")
    os.makedirs("out", exist_ok=True)
    json.dump(out, open("out/detect.json", "w"), indent=1)
    open("out/detect.md", "w").write("\n".join(md) + "\n")
    print("\n".join(md))


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])

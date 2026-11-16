"""Skill step 1 + U1 on every downloaded app: unpack bundles, find the engine,
Mono vs IL2CPP, Unity version, script count. Writes out/detect.md and out/detect.json.

Usage: python3 ci/detect.py dl work
"""
import json, os, re, struct, sys, zipfile

VER = re.compile(rb"(20[1-9][0-9]|6000)\.[0-9]+\.[0-9]+[abfp][0-9]+")


def merge(path, dest):
    """Unpack an APK or a bundle (XAPK/APKM/APKS) into dest. Returns notes."""
    notes = []
    os.makedirs(dest, exist_ok=True)
    try:
        z = zipfile.ZipFile(path)
    except zipfile.BadZipFile as e:
        return [f"not a readable zip: {e}"]
    names = z.namelist()
    inner = [n for n in names if n.lower().endswith(".apk")]
    if "AndroidManifest.xml" in names:
        z.extractall(dest)
        notes.append("plain APK")
    elif inner:
        notes.append(f"bundle with {len(inner)} APKs")
        for n in inner:
            tmp = os.path.join(dest, "_" + os.path.basename(n))
            with open(tmp, "wb") as f:
                f.write(z.read(n))
            try:
                zipfile.ZipFile(tmp).extractall(dest)
            except zipfile.BadZipFile:
                notes.append(f"{n}: broken")
            os.remove(tmp)
        for n in names:
            if n.lower().endswith(".obb"):
                notes.append(f"obb: {n}")
                ob = os.path.join(dest, "obb", os.path.basename(n))
                os.makedirs(os.path.dirname(ob), exist_ok=True)
                with open(ob, "wb") as f:
                    f.write(z.read(n))
    else:
        notes.append("zip without AndroidManifest.xml or APKs")
    return notes


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
    elif libs & {"libUE4.so", "libUnreal.so"}:
        r["engine"] = "Unreal"
    elif any(l.startswith("libgodot") for l in libs):
        r["engine"] = "Godot"
    elif "libflutter.so" in libs:
        r["engine"] = "Flutter"
    elif has("assets/www/index.html"):
        r["engine"] = "Web (Cordova)"
    else:
        r["engine"] = "native/other"
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

"""Skill step 1, first part: turn ANY Android package into one merged folder.

Usage: python3 ci/unpack.py <input> <out dir> [more inputs...]
Inputs can be: .apk, .xapk, .apkm, .apks, .aab, .obb, .zip of any of these, a folder,
or several loose split APKs given together. Writes <out>/all (merged app files),
<out>/base.apk (the main APK, for androguard), <out>/report.json, and prints a report.

Rules (each learned on real files):
- splits first, base APK last, and never let a split's AndroidManifest.xml/resources.arsc win
- .obb and UE4's assets/main.obb.png are zips: unpack into all/obb/
- AAB has base/manifest/AndroidManifest.xml (protobuf), base/lib, base/assets, base/dex:
  convert with bundletool if Java is there, else map the folders directly
- a cut-off bundle still yields its complete inner APKs (sliced by their own end records)
- protected/encrypted apps are flagged, not discovered halfway through
"""
import json, os, re, shutil, struct, subprocess, sys, zipfile

PROTECTORS = {  # library name pattern -> protector (code hidden or encrypted; conversion needs the real files)
    r"libjiagu": "Jiagu (360)", r"libsecexe|libsecmain|libSecShell": "Bangcle", r"libDexHelper": "SecNeo/DexHelper",
    r"libexec(main)?\.so": "ijiami", r"libshell[a-z0-9]*\.so|libtxAppEntry|liblegu": "Tencent Legu",
    r"libmobisec|libsgmain": "Alibaba", r"libnqshield": "NQ Shield", r"libapssec": "Baidu", r"libprotectClass": "Ali protect",
    r"libdexjni|libvdog": "other packer", r"libpairipcore": "Google Play Integrity (pairip)",
}


def is_zip(path):
    try:
        with open(path, "rb") as f:
            return f.read(2) == b"PK"
    except OSError:
        return False


def slice_inner_apks(path, dest):
    """Cut-off bundle: pull out every complete inner APK from its local header to its own end record."""
    d = open(path, "rb").read()
    found = []
    for m in re.finditer(rb"PK\x03\x04", d):
        p = m.start()
        nl, el = struct.unpack("<HH", d[p + 26:p + 30])
        name = d[p + 30:p + 30 + nl].decode("utf-8", "replace")
        if not name.endswith(".apk"):
            continue
        start = p + 30 + nl + el
        out = os.path.join(dest, os.path.basename(name))
        e = d.find(b"PK\x05\x06", start)
        while e >= 0:  # compressed data can contain a false end marker: try each until the zip is valid
            clen = struct.unpack("<H", d[e + 20:e + 22])[0] if e + 22 <= len(d) else 0
            open(out, "wb").write(d[start:e + 22 + clen])
            try:
                with zipfile.ZipFile(out) as z:
                    if z.testzip() is None and "AndroidManifest.xml" in z.namelist():
                        found.append(out)
                        break
            except (zipfile.BadZipFile, ValueError, OSError, EOFError):
                pass
            e = d.find(b"PK\x05\x06", e + 4)
        else:
            if os.path.exists(out):
                os.remove(out)
    return found


def collect(inputs, work, notes):
    """Return (apk_files, obb_files, aab_files, extra_dirs) from any mix of inputs."""
    apks, obbs, aabs, dirs = [], [], [], []
    queue = list(inputs)
    n = 0
    while queue:
        p = queue.pop(0)
        low = p.lower()
        if os.path.isdir(p):
            for d, _, fs in os.walk(p):
                queue += [os.path.join(d, f) for f in fs if f.lower().endswith((".apk", ".obb", ".aab", ".apks", ".xapk", ".apkm", ".zip"))]
            if os.path.exists(os.path.join(p, "AndroidManifest.xml")):
                dirs.append(p)
            continue
        if low.endswith(".obb") or low.endswith(".obb.png"):
            obbs.append(p)
            continue
        if not is_zip(p):
            notes.append(f"{os.path.basename(p)}: not a zip (encrypted or not an Android package)")
            continue
        try:
            z = zipfile.ZipFile(p)
            names = z.namelist()
        except zipfile.BadZipFile:
            n += 1
            sub = os.path.join(work, f"sliced{n}")
            os.makedirs(sub, exist_ok=True)
            got = slice_inner_apks(p, sub)
            notes.append(f"{os.path.basename(p)}: zip index missing (download cut off?); recovered {len(got)} complete APKs")
            apks += got
            continue
        if "AndroidManifest.xml" in names and not any(x.endswith(".apk") for x in names):
            # a plain APK... unless unzip sees the first inner APK of a cut-off bundle
            head = open(p, "rb").read(512)
            first = head[30:30 + struct.unpack("<H", head[26:28])[0]].decode("latin1") if head[:4] == b"PK\x03\x04" else ""
            if first.endswith(".apk"):  # the zip's own first entry is an APK: it's a bundle whose index is missing
                n += 1
                sub = os.path.join(work, f"sliced{n}")
                os.makedirs(sub, exist_ok=True)
                got = slice_inner_apks(p, sub)
                notes.append(f"{os.path.basename(p)}: looks like a plain APK but is a cut-off bundle; recovered {len(got)} APKs")
                apks += got
            else:
                apks.append(p)
            continue
        if "BundleConfig.pb" in names or any(x.startswith("base/manifest/") for x in names):
            aabs.append(p)
            continue
        # a bundle or a zip of things: extract and look again
        n += 1
        sub = os.path.join(work, f"in{n}")
        z.extractall(sub)
        for meta in ("manifest.json", "info.json"):
            mp = os.path.join(sub, meta)
            if os.path.exists(mp):
                try:
                    m = json.load(open(mp, encoding="utf-8", errors="replace"))
                    notes.append(f"{meta}: package {m.get('package_name') or m.get('pname')}, version {m.get('version_name') or m.get('versionName')}")
                except ValueError:
                    pass
        notes.append(f"{os.path.basename(p)}: bundle/zip with {sum(1 for x in names if x.endswith('.apk'))} APKs, {sum(1 for x in names if x.endswith('.obb'))} OBBs")
        queue.append(sub)
    return apks, obbs, aabs, dirs


def aab_to_apks(aab, work, notes):
    """Use bundletool for a universal APK when Java is around; else map AAB folders by hand."""
    bt = os.environ.get("BUNDLETOOL")
    if bt and shutil.which("java"):
        out = os.path.join(work, "aab.apks")
        r = subprocess.run(["java", "-jar", bt, "build-apks", f"--bundle={aab}", f"--output={out}", "--mode=universal"],
                           capture_output=True, text=True)
        if r.returncode == 0:
            d = os.path.join(work, "aab_apks")
            zipfile.ZipFile(out).extractall(d)
            notes.append("AAB converted with bundletool (universal APK, debug-signed)")
            return [os.path.join(d, "universal.apk")], None
        notes.append(f"bundletool failed: {r.stderr.strip()[:200]}")
    # by hand: base/{lib,assets,root,dex,res} -> APK layout (the manifest stays protobuf: read it with bundletool or aapt2)
    d = os.path.join(work, "aab_mapped")
    z = zipfile.ZipFile(aab)
    for name in z.namelist():
        parts = name.split("/", 2)
        if len(parts) < 3 or parts[0] in ("BUNDLE-METADATA", "META-INF"):
            continue
        module, kind, rest = parts
        target = {"lib": f"lib/{rest}", "assets": f"assets/{rest}", "root": rest, "res": f"res/{rest}",
                  "dex": rest, "manifest": f"_manifest_pb/{module}/{rest}"}.get(kind)
        if target:
            out = os.path.join(d, target)
            os.makedirs(os.path.dirname(out), exist_ok=True)
            with open(out, "wb") as f:
                f.write(z.read(name))
    notes.append("AAB mapped by hand (no bundletool/Java): its AndroidManifest.xml is in protobuf format, read it with bundletool dump manifest")
    return [], d


def main():
    inputs, out = sys.argv[1:2] + sys.argv[3:], sys.argv[2]
    work = os.path.join(out, "_work")
    allf = os.path.join(out, "all")
    for p in (work, allf):
        os.makedirs(p, exist_ok=True)
    notes = []
    apks, obbs, aabs, dirs = collect(inputs, work, notes)
    extra_trees = list(dirs)
    for aab in aabs:
        got, mapped = aab_to_apks(aab, work, notes)
        apks += got
        if mapped:
            extra_trees.append(mapped)
    # base APK: not a config/split APK; prefer base.apk, then the biggest
    def is_split(p):
        b = os.path.basename(p)
        return b.startswith(("split_", "config.")) or re.match(r".*\.config\.", b)
    bases = [p for p in apks if not is_split(p)]
    base = next((p for p in bases if os.path.basename(p) == "base.apk"), None) or (max(bases, key=os.path.getsize) if bases else None)
    for p in apks:
        if p == base:
            continue
        with zipfile.ZipFile(p) as z:
            for name in z.namelist():
                if name in ("AndroidManifest.xml", "resources.arsc") or name.startswith("META-INF/"):
                    continue
                z.extract(name, allf)
    for t in extra_trees:
        shutil.copytree(t, allf, dirs_exist_ok=True)
    if base:
        zipfile.ZipFile(base).extractall(allf)  # last, so its manifest wins
        shutil.copy(base, os.path.join(out, "base.apk"))
    # OBB data (and UE4's assets/main.obb.png)
    obbs += [os.path.join(d, f) for d, _, fs in os.walk(allf) for f in fs if f.endswith(".obb.png") or f.endswith(".obb")]
    for o in obbs:
        dest = os.path.join(allf, "obb", os.path.basename(o).replace(".png", ""))
        if is_zip(o):
            try:
                zipfile.ZipFile(o).extractall(dest)
                notes.append(f"OBB {os.path.basename(o)}: zip, unpacked to all/obb/")
            except zipfile.BadZipFile:
                notes.append(f"OBB {os.path.basename(o)}: zip but broken")
        else:
            notes.append(f"OBB {os.path.basename(o)}: not a zip (raw game data; engine-specific)")
    # protected or encrypted?
    libs = sorted({f for _, _, fs in os.walk(os.path.join(allf, "lib")) for f in fs})
    warn = [f"{name}: {lib}" for lib in libs for pat, name in PROTECTORS.items() if re.search(pat, lib)]
    meta = [os.path.join(d, f) for d, _, fs in os.walk(allf) for f in fs if f == "global-metadata.dat"]
    for m in meta:
        if open(m, "rb").read(4) != bytes.fromhex("af1bb1fa"):
            warn.append("Unity IL2CPP global-metadata.dat is encrypted or changed (wrong magic)")
    droid = [os.path.join(d, f) for d, _, fs in os.walk(allf) for f in fs if f in ("game.droid", "data.win")]
    for g in droid:
        if open(g, "rb").read(4) != b"FORM":
            warn.append("GameMaker data file is encrypted or changed (no FORM header)")
    jsc = [f for _, _, fs in os.walk(os.path.join(allf, "assets")) for f in fs if f.endswith(".jsc")]
    if jsc:
        warn.append(f"Cocos scripts are compiled/encrypted (.jsc x{len(jsc)}): needs the XXTEA key from the engine library")
    dexes = [f for f in os.listdir(allf) if re.match(r"classes\d*\.dex$", f)]
    if not dexes and not libs:
        warn.append("no classes.dex and no native libraries: not an app, or everything is packed")
    report = {"inputs": inputs, "apks": [os.path.basename(p) for p in apks], "base": os.path.basename(base) if base else None,
              "obbs": [os.path.basename(o) for o in obbs], "aabs": [os.path.basename(a) for a in aabs],
              "libs": libs, "notes": notes, "protected_or_encrypted": warn}
    json.dump(report, open(os.path.join(out, "report.json"), "w"), indent=1)
    shutil.rmtree(work, ignore_errors=True)
    print(json.dumps(report, indent=1))


if __name__ == "__main__":
    main()

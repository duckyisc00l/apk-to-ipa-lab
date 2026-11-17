"""Skill step U2 cleanup on an AssetRipper export, for any Unity game.

- Unity's own packages come back as decompiled scripts under Assets/Scripts/<Assembly>.
  Delete them and add the real package to Packages/manifest.json, at the newest version
  in Unity's package registry that supports the game's Unity version.
- Remove Android-only plugins.
- Set iOS player settings.

Usage: python3 ci/recover/cleanup.py <ExportedProject> <unity_version> <bundle_id> <product_name>
Writes a report to stdout (markdown).
"""
import json, os, re, shutil, sys, urllib.request

# assembly folder name (prefix match) -> package id
UNITY_PACKAGES = [
    ("Unity.InputSystem", "com.unity.inputsystem"),
    ("UnityEngine.UI", "com.unity.ugui"),
    ("Unity.TextMeshPro", "com.unity.textmeshpro"),
    ("Unity.Timeline", "com.unity.timeline"),
    ("Unity.Mathematics", "com.unity.mathematics"),
    ("Unity.VectorGraphics", "com.unity.vectorgraphics"),
    ("Unity.AI.Navigation", "com.unity.ai.navigation"),
    ("Unity.Collections", "com.unity.collections"),
    ("Unity.Burst", "com.unity.burst"),
    ("Unity.Addressables", "com.unity.addressables"),
    ("Unity.ResourceManager", "com.unity.addressables"),
    ("Unity.RenderPipelines.Universal", "com.unity.render-pipelines.universal"),
    ("Unity.RenderPipelines.Core", "com.unity.render-pipelines.core"),
    ("Unity.Postprocessing", "com.unity.postprocessing"),
    ("Cinemachine", "com.unity.cinemachine"),
    ("Unity.Cinemachine", "com.unity.cinemachine"),
    ("Unity.Localization", "com.unity.localization"),
    ("Unity.Services", None),          # cloud services: remove, game runs offline
    ("Unity.Analytics", None),
    ("Unity.Advertisement", None),     # ads: removed
    ("Unity.Purchasing", None),        # Play purchases: removed
    ("UnityEngine.Purchasing", None),
]
# Leftovers of Unity's own modules or internals: just delete
DELETE_ONLY = re.compile(r"^(Unity\.InternalAPIEngineBridge|UnityEngine\.[A-Za-z]+Module$|Unity\.InputSystem\.ForUI$|"
                         r"System\.Runtime\.CompilerServices\.Unsafe$|Unity\.Burst\.Unsafe$)")
ANDROID_ONLY = re.compile(r"(GooglePlay|GoogleMobileAds|Firebase|AndroidRuntimePermissions|com\.google\.)", re.I)


def unity_tuple(v):
    m = re.match(r"(\d+)\.(\d+)", v or "")
    return (int(m.group(1)), int(m.group(2))) if m else (0, 0)


# Packages built into the editor: not versioned in the registry the normal way.
BUILT_IN = {"com.unity.ugui": "1.0.0"}


VERSION_IN_CODE = [
    re.compile(r'new\s+Version\("(\d+\.\d+\.\d+)"\)'),
    re.compile(r'(?:k?[Vv]ersion|VersionString|PackageVersion)\s*=\s*"(\d+\.\d+\.\d+(?:-[\w.]+)?)"'),
]


def version_in_code(folder):
    """Some packages carry their own version as a constant (Input System does)."""
    for d, _, files in os.walk(folder):
        for f in files:
            if f.endswith(".cs"):
                s = open(os.path.join(d, f), encoding="utf-8", errors="replace").read()
                for rx in VERSION_IN_CODE:
                    m = rx.search(s)
                    if m:
                        return m.group(1), os.path.relpath(os.path.join(d, f), folder)
    return None, None


_EDITOR_DATE = {}


def editor_release_date(unity_version):
    if unity_version not in _EDITOR_DATE:
        try:
            with urllib.request.urlopen("https://services.api.unity.com/unity/editor/release/v1/releases?version="
                                        + unity_version, timeout=60) as r:
                d = json.load(r)
            rel = d["results"][0] if "results" in d else d
            _EDITOR_DATE[unity_version] = rel.get("releaseDate", "")[:10]
        except Exception:  # noqa: BLE001
            _EDITOR_DATE[unity_version] = ""
    return _EDITOR_DATE[unity_version]


def best_version(pkg, unity_version):
    """Newest release of pkg that supports the game's Unity version and came out
    before that Unity version did (projects rarely use packages newer than their editor)."""
    if pkg in BUILT_IN:
        return BUILT_IN[pkg], "built into the editor"
    try:
        with urllib.request.urlopen(f"https://packages.unity.com/{pkg}", timeout=60) as r:
            data = json.load(r)
    except Exception as e:  # noqa: BLE001
        return None, f"registry error: {e}"
    want = unity_tuple(unity_version)
    cutoff = editor_release_date(unity_version) or "9999"
    times = data.get("time", {})
    ok = []
    for ver, meta in data.get("versions", {}).items():
        if times.get(ver, "0000")[:10] > cutoff:
            continue
        if re.search(r"-(pre|exp|preview)", ver) and not pkg.endswith("vectorgraphics"):
            continue
        if unity_tuple(meta.get("unity", "0.0")) <= want:
            ok.append(ver)
    def key(v):
        return [int(x) if x.isdigit() else -1 for x in re.split(r"[.\-]", v)]
    return (sorted(ok, key=key)[-1] if ok else None), f"by date (before {cutoff})"


# ---- references from scenes and prefabs to the deleted package scripts ----
# Scenes point at a script by its .meta guid. The decompiled package scripts get deleted, so without this every
# EventSystem, Image, Text, InputSystemUIInputModule... in every scene becomes "The referenced script is missing".
NS = re.compile(r"^\s*namespace\s+([\w.]+)", re.M)

def script_classes(folder):
    """guid -> full class name (namespace + file name) for every .cs under folder"""
    out = {}
    for d, _, files in os.walk(folder):
        for f in files:
            if f.endswith(".cs") and os.path.exists(os.path.join(d, f + ".meta")):
                m = re.search(r"guid: ([0-9a-f]{32})", open(os.path.join(d, f + ".meta"), errors="ignore").read())
                if not m:
                    continue
                t = open(os.path.join(d, f), errors="ignore").read()
                ns = NS.search(t)
                out[m.group(1)] = (ns.group(1) + "." if ns else "") + f[:-3]
    return out

def package_classes(pkg, ver, cache="/tmp/unity-pkgs"):
    """full class name -> guid in the real package (downloaded from Unity's registry)"""
    import tarfile, io
    os.makedirs(cache, exist_ok=True)
    try:
        info = json.load(urllib.request.urlopen(f"https://packages.unity.com/{pkg}", timeout=60))
        url = info["versions"][ver]["dist"]["tarball"]
        data = urllib.request.urlopen(url, timeout=120).read()
    except Exception as x:
        return {}, f"{pkg}@{ver}: not downloaded ({x})"
    d = os.path.join(cache, f"{pkg}@{ver}")
    tarfile.open(fileobj=io.BytesIO(data)).extractall(d)
    out = {}
    for full in script_classes(d).items():
        out.setdefault(full[1], full[0])
    return out, f"{pkg}@{ver}: {len(out)} scripts"

def remap_package_scripts(proj, old, deps):
    """old: guid -> (full class name, package id). Rewrites {fileID: 11500000, guid: OLD, type: 3} everywhere."""
    want = {}
    for g, (cls, pkg) in old.items():
        want.setdefault(pkg, {})[g] = cls
    remap, notes = {}, []
    for pkg, items in want.items():
        ver = deps.get(pkg)
        if not ver:
            continue
        new, note = package_classes(pkg, ver)
        notes.append(note)
        for g, cls in items.items():
            if cls in new:
                remap[g] = new[cls]
    changed = 0
    if remap:
        rx = re.compile(r"(\{fileID: 11500000, guid: )([0-9a-f]{32})(, type: 3\})")
        for d, _, files in os.walk(os.path.join(proj, "Assets")):
            for f in files:
                if f.endswith((".unity", ".prefab", ".asset", ".controller", ".playable", ".mat")):
                    fp = os.path.join(d, f)
                    t = open(fp, errors="ignore").read()
                    nt = rx.sub(lambda m: m.group(1) + remap.get(m.group(2), m.group(2)) + m.group(3), t)
                    if nt != t:
                        open(fp, "w").write(nt)
                        changed += 1
    return remap, changed, notes


def main(proj, unity_version, bundle_id, product):
    report = ["# Cleanup", "", f"Project: `{proj}`  Unity {unity_version}", ""]
    scripts = os.path.join(proj, "Assets", "Scripts")
    manifest_path = os.path.join(proj, "Packages", "manifest.json")
    manifest = json.load(open(manifest_path)) if os.path.exists(manifest_path) else {"dependencies": {}}
    deps = manifest.setdefault("dependencies", {})
    removed, added, android = [], {}, []
    old_scripts = {}   # guid -> (class, package) of the decompiled package scripts about to be deleted
    for folder in sorted(os.listdir(scripts)) if os.path.isdir(scripts) else []:
        path = os.path.join(scripts, folder)
        pkg = next((p for prefix, p in UNITY_PACKAGES if folder == prefix or folder.startswith(prefix + ".")), "NOMATCH")
        if pkg != "NOMATCH":
            n = sum(len(f) for _, _, f in os.walk(path))
            code_ver, where = version_in_code(path) if pkg else (None, None)
            if pkg:
                for g, cls in script_classes(path).items():
                    old_scripts[g] = (cls, pkg)
            shutil.rmtree(path)
            removed.append(f"{folder} ({n} files)")
            if pkg and pkg not in deps and pkg not in added:
                if code_ver:
                    ver, note = code_ver, f"from the package's own code ({where})"
                else:
                    ver, note = best_version(pkg, unity_version)
                if ver:
                    deps[pkg] = ver
                    added[pkg] = f"{ver}  ({note})"
                else:
                    added[pkg] = f"NOT ADDED ({note})"
        elif DELETE_ONLY.match(folder):
            shutil.rmtree(path)
            removed.append(f"{folder} (internal)")
        elif ANDROID_ONLY.search(folder):
            shutil.rmtree(path)
            android.append(folder)
    # Classes Unity's own source generators add at build time come back decompiled, and Unity
    # generates them again when it compiles: delete the decompiled copies (else CS0101/CS0111).
    generated = []
    for d, _, files in os.walk(os.path.join(proj, "Assets")):
        for f in files:
            if f.endswith(".cs"):
                fp = os.path.join(d, f)
                txt = open(fp, encoding="utf-8", errors="replace").read()
                if re.search(r"\bclass\s+UnitySourceGenerated\w*", txt):
                    os.remove(fp)
                    meta = fp + ".meta"
                    if os.path.exists(meta):
                        os.remove(meta)
                    generated.append(os.path.relpath(fp, proj))
    for sub in ("Assets/Plugins/Android",):
        p = os.path.join(proj, sub)
        if os.path.isdir(p):
            shutil.rmtree(p)
            android.append(sub)
    json.dump(manifest, open(manifest_path, "w"), indent=2)
    json.dump(old_scripts, open(os.path.join(proj, "package-scripts-removed.json"), "w"), indent=0)
    remap, changed, notes = remap_package_scripts(proj, old_scripts, deps)
    report += ["## Scene references moved to the real package scripts",
               f"- {len(remap)} of {len(old_scripts)} scripts matched, {changed} files changed", *[f"- {n}" for n in notes], ""]

    # iOS player settings
    ps = os.path.join(proj, "ProjectSettings", "ProjectSettings.asset")
    if os.path.exists(ps):
        s = open(ps, encoding="utf-8", errors="replace").read()
        s = re.sub(r"(\n  productName: ).*", r"\g<1>" + product, s, count=1)
        s = re.sub(r"(\n    iPhone: )[^\n]*", r"\g<1>" + bundle_id, s, count=1)
        s = re.sub(r"(\n  iOSTargetOSVersionString: ).*", r"\g<1>15.0", s, count=1)
        # iOS kills an app that opens the mic/camera/location with no reason text: always fill them
        for key, text in (("microphone", "Used for the game's voice and sound features."),
                          ("camera", "Used for the game's camera features."),
                          ("location", "Used for the game's location features.")):
            s = re.sub(rf"(\n  {key}UsageDescription:)[ \t]*\n", rf"\g<1> {text}\n", s, count=1)
        open(ps, "w", encoding="utf-8").write(s)
        report.append(f"iOS settings: product `{product}`, bundle id `{bundle_id}`, iOS 15.0")

    left = sorted(os.listdir(scripts)) if os.path.isdir(scripts) else []
    report += ["", "## Removed Unity package scripts", *[f"- {r}" for r in removed],
               "", "## Packages added to manifest.json", *[f"- {k}: {v}" for k, v in added.items()],
               "", "## Unity-generated classes removed (Unity makes them again)", *[f"- {g}" for g in generated or ['none']],
               "", "## Android-only removed (calls to these must be stubbed)", *[f"- {a}" for a in android or ['none']],
               "", "## Script folders kept (game code and third-party libraries)",
               *[f"- {d}: {sum(len(f) for _, _, f in os.walk(os.path.join(scripts, d)))} files" for d in left]]
    print("\n".join(report))


if __name__ == "__main__":
    if sys.argv[1] == "--remap-only":
        # for a project cleaned before this existed: <project> <a fresh AssetRipper export's Assets/Scripts>
        proj, export_scripts = sys.argv[2], sys.argv[3]
        deps = json.load(open(os.path.join(proj, "Packages", "manifest.json")))["dependencies"]
        old = {}
        for folder in sorted(os.listdir(export_scripts)):
            pkg = next((p for prefix, p in UNITY_PACKAGES if folder == prefix or folder.startswith(prefix + ".")), None)
            if pkg:
                for g, cls in script_classes(os.path.join(export_scripts, folder)).items():
                    old[g] = (cls, pkg)
        remap, changed, notes = remap_package_scripts(proj, old, deps)
        print(f"{len(remap)} of {len(old)} package scripts matched; {changed} files changed"); print("\n".join(notes))
    else:
        main(*sys.argv[1:5])

"""Ren'Py APK -> plain Ren'Py project folder.

Usage: python3 -I prep.py <merged apk dir (unpack.py all/)> <out project dir>
Android Ren'Py stores files under assets/ with an "x-" prefix on every path part
(assets/x-game/x-script.rpyc). Strip it. Compiled .rpyc and .rpa archives run as they are,
so no decompiling is needed. Prints the Ren'Py version if it can be found.
"""
import os, re, shutil, sys, zipfile

src, out = sys.argv[1], sys.argv[2]
assets = os.path.join(src, "assets")
os.makedirs(out, exist_ok=True)
version = None
for d, _, fs in os.walk(assets):
    for f in fs:
        rel = os.path.relpath(os.path.join(d, f), assets)
        parts = rel.split(os.sep)
        if not parts[0].startswith("x-"):
            continue
        clean = os.path.join(*[p[2:] if p.startswith("x-") else p for p in parts])
        if clean.startswith("game" + os.sep):
            dest = os.path.join(out, clean)
            os.makedirs(os.path.dirname(dest), exist_ok=True)
            shutil.copy(os.path.join(d, f), dest)
        if clean.endswith("vc_version.py"):
            m = re.search(r"version\s*=\s*u?['\"]([\d.]+)", open(os.path.join(d, f), errors="replace").read())
            version = version or (m and m.group(1))
# private.mp3 / private.zip hold the Python side (renpy module) on some versions
for name in ("private.mp3", "private.zip"):
    p = os.path.join(assets, name)
    if os.path.exists(p) and not version:
        try:
            z = zipfile.ZipFile(p)
            for n in z.namelist():
                if n.endswith("vc_version.py"):
                    m = re.search(r"version\s*=\s*u?['\"]([\d.]+)", z.read(n).decode(errors="replace"))
                    version = m and m.group(1)
        except zipfile.BadZipFile:
            pass
sv = os.path.join(out, "game", "script_version.txt")  # written by the Ren'Py that built the game: (7, 3, 5, 606)
if os.path.exists(sv) and not version:
    nums = re.findall(r"\d+", open(sv, errors="replace").read())
    version = ".".join(nums[:3]) if len(nums) >= 3 else None
libs = {f for _, _, fs in os.walk(os.path.join(src, "lib")) for f in fs}
major = "8" if any("python3" in l for l in libs) else "7" if any("python2" in l for l in libs) else None
game = os.path.join(out, "game")
n = sum(len(fs) for _, _, fs in os.walk(game)) if os.path.isdir(game) else 0
print(f"version={version or ''}")
print(f"major={major or ''}")
print(f"files={n}")
print(f"rpyc={sum(1 for _, _, fs in os.walk(game) for f in fs if f.endswith('.rpyc'))} rpa={sum(1 for _, _, fs in os.walk(game) for f in fs if f.endswith('.rpa'))}" if n else "rpyc=0")

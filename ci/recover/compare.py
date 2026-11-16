"""Measure how complete a recovery is, for an open-source game: compare the class
names in the recovered project with the ones in the game's real source.

Usage: python3 ci/recover/compare.py <recovered Assets/Scripts> <original source root>
"""
import os, re, sys

CLASS = re.compile(r"^\s*(?:public|internal|private|protected|abstract|sealed|static|partial|\s)*"
                   r"(?:class|struct|enum|interface)\s+([A-Za-z_][A-Za-z0-9_]*)", re.M)


def classes(root, skip=()):
    found = {}
    for d, dirs, files in os.walk(root):
        dirs[:] = [x for x in dirs if x not in ("Library", "Temp", "Packages", ".git") and not x.startswith(skip)]
        for f in files:
            if f.endswith(".cs"):
                p = os.path.join(d, f)
                try:
                    for name in CLASS.findall(open(p, encoding="utf-8", errors="replace").read()):
                        found.setdefault(name, p)
                except OSError:
                    pass
    return found


def stub_ratio(root):
    total = stubs = 0
    body = re.compile(r"\)\s*\{\s*(return\s+(null|default|0|false)\s*;|throw null;|)\s*\}")
    for d, _, files in os.walk(root):
        for f in files:
            if f.endswith(".cs"):
                s = open(os.path.join(d, f), encoding="utf-8", errors="replace").read()
                total += len(re.findall(r"\)\s*\{", s))
                stubs += len(body.findall(s))
    return total, stubs


def main(recovered, original):
    rec = classes(recovered)
    # the original's own game code lives under Assets/ (skip Editor-only folders: they never ship in an APK)
    # Editor, Tests and StreamingAssets code never ships compiled in an APK
    orig = classes(original, skip=("Editor", "Tests", "StreamingAssets"))
    common = set(rec) & set(orig)
    only_orig = sorted(set(orig) - set(rec))
    total, stubs = stub_ratio(recovered)
    print("# Recovery vs real source", "")
    print(f"- classes in real source (no Editor, Tests or StreamingAssets folders): {len(orig)}")
    print(f"- classes recovered: {len(rec)}")
    print(f"- real classes found in recovery: {len(common)} ({100 * len(common) // max(1, len(orig))}%)")
    print(f"- methods in recovery: {total}, empty/stub bodies: {stubs} ({100 * stubs // max(1, total)}%)")
    print("", "## First 40 real classes missing from the recovery")
    for n in only_orig[:40]:
        print(f"- {n}  ({os.path.relpath(orig[n], original)})")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])

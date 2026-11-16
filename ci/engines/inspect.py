"""For every unpacked app under work/, print the facts each skill route needs:
engine signs in lib/ and assets/, web root, Godot .pck, Ren'Py game files, LÖVE game,
React Native bundle (Hermes or plain JS), Flutter assets, Capacitor config, OBB data.

Usage: python3 ci/engines/inspect.py work
"""
import os, sys


def walk(root):
    for d, _, fs in os.walk(root):
        for f in fs:
            yield os.path.relpath(os.path.join(d, f), root)


def main(work):
    for game in sorted(os.listdir(work)):
        root = os.path.join(work, game)
        files = list(walk(root))
        libs = sorted({os.path.basename(f) for f in files if f.startswith("lib/") and f.endswith(".so")})
        print(f"## {game}\n")
        print(f"- files: {len(files)}; libs: {' '.join(libs[:25])}")
        def has(*names):
            return [f for f in files if any(f.endswith(n) or f == n for n in names)]
        for label, hits in [
            ("Godot .pck", has(".pck")),
            ("Godot project files", [f for f in files if f.endswith(("project.godot", "project.binary"))]),
            ("Ren'Py", [f for f in files if "x-game" in f or f.endswith((".rpa", ".rpyc"))][:5]),
            ("LÖVE", has("game.love")),
            ("React Native bundle", has("index.android.bundle")),
            ("Flutter assets", [f for f in files if "flutter_assets" in f][:5]),
            ("Capacitor", has("capacitor.config.json", "capacitor.plugins.json")),
            ("Cordova", has("cordova.js")),
            ("index.html", has("index.html")[:5]),
            ("OBB", has(".obb")),
            ("Unreal paks", [f for f in files if f.endswith((".pak", ".utoc", ".ucas"))][:5]),
        ]:
            if hits:
                print(f"- {label}: {', '.join(hits[:5])}")
        rn = has("index.android.bundle")
        if rn:
            with open(os.path.join(root, rn[0]), "rb") as fh:
                head = fh.read(8)
            print(f"- RN bundle format: {'Hermes bytecode' if head[:4] == bytes.fromhex('c61fbc03') else 'plain JS'} ({head.hex()})")
        print()


if __name__ == "__main__":
    main(sys.argv[1])

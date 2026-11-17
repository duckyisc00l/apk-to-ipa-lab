"""Protection check on real unpacked apps with one protection sign planted at a time.

No open-source app ships packed, so each sign the skill lists is planted into a copy of a real,
clean, unpacked app (from ci/unpack.py) and ci/protect.py must flag exactly that one. Nothing is
unpacked or decrypted: this only tests that the sign is seen.

Usage: python3 ci/detect-suite/fixtures.py <unpacked all/ of a clean Unity IL2CPP app> <of a GameMaker app> <of a Java app>
"""
import importlib.util, json, os, shutil, sys

HERE = os.path.dirname(os.path.abspath(__file__))
spec = importlib.util.spec_from_file_location("protect", os.path.join(HERE, "..", "protect.py"))
protect = importlib.util.module_from_spec(spec)
spec.loader.exec_module(protect)


def find(root, name):
    for d, _, fs in os.walk(root):
        if name in fs:
            return os.path.join(d, name)
    return None


def first_lib_dir(root):
    for d, _, fs in os.walk(os.path.join(root, "lib")):
        if any(f.endswith(".so") for f in fs):
            return d
    d = os.path.join(root, "lib", "arm64-v8a")
    os.makedirs(d, exist_ok=True)
    return d


def xor_head(path, n=4):
    with open(path, "r+b") as f:
        h = f.read(n)
        f.seek(0)
        f.write(bytes(b ^ 0x5A for b in h))


def append(path, data):
    with open(path, "ab") as f:
        f.write(data)


CASES = [  # (name, which app, plant function, expected level, expected name part)
    ("Jiagu library", "java", lambda r: open(os.path.join(first_lib_dir(r), "libjiagu_a64.so"), "wb").write(b"\x7fELF"), "packed", "Jiagu"),
    ("Jiagu stub class", "java", lambda r: append(os.path.join(r, "classes.dex"), b"Lcom/stub/StubApp;"), "packed", "Jiagu"),
    ("Bangcle library", "java", lambda r: open(os.path.join(first_lib_dir(r), "libsecexe.so"), "wb").write(b"\x7fELF"), "packed", "Bangcle"),
    ("Legu library", "java", lambda r: open(os.path.join(first_lib_dir(r), "libshella-2.10.3.0.so"), "wb").write(b"\x7fELF"), "packed", "Legu"),
    ("SecNeo DexHelper", "java", lambda r: open(os.path.join(first_lib_dir(r), "libDexHelper.so"), "wb").write(b"\x7fELF"), "packed", "DexHelper"),
    ("ijiami asset", "java", lambda r: open(os.path.join(r, "assets", "ijiami.dat"), "wb").write(b"x"), "packed", "ijiami"),
    ("pairip", "java", lambda r: open(os.path.join(first_lib_dir(r), "libpairipcore.so"), "wb").write(b"\x7fELF"), "integrity", "pairip"),
    ("no dex, no libs", "java", lambda r: [os.remove(os.path.join(r, f)) for f in os.listdir(r) if f.endswith(".dex")]
     + [shutil.rmtree(os.path.join(r, "lib"), ignore_errors=True)], "packed", "no classes.dex"),
    ("dex not a dex", "java", lambda r: xor_head(os.path.join(r, "classes.dex")), "packed", "not a dex"),
    ("Cordova crypt-file", "java", lambda r: append(os.path.join(r, "classes.dex"), b"Lcom/tkyaji/cordova/DecryptResource;"), "encrypted", "crypt-file"),
    ("IL2CPP metadata", "unity", lambda r: xor_head(find(r, "global-metadata.dat")), "encrypted", "global-metadata"),
    ("GameMaker data", "gm", lambda r: xor_head(find(r, "game.droid") or find(r, "data.win")), "encrypted", "GameMaker"),
    ("Cocos .jsc", "java", lambda r: open(os.path.join(r, "assets", "main.jsc"), "wb").write(b"\x01\x02"), "encrypted", ".jsc"),
    ("Godot .gde", "java", lambda r: open(os.path.join(r, "assets", "player.gde"), "wb").write(b"\x01\x02"), "encrypted", ".gde"),
]


def main(unity, gm, java):
    apps = {"unity": unity, "gm": gm, "java": java}
    os.makedirs("out", exist_ok=True)
    lines = ["# Protection fixtures (one sign planted into a real clean app)", "",
             "| case | app | clean app flags | flags after planting | result |", "|---|---|---|---|---|"]
    ok = 0
    for name, which, plant, level, part in CASES:
        src = apps[which]
        clean = [f"{x['level']}: {x['name']}" for x in protect.scan(src) if x["level"] != "integrity"]
        tmp = "/tmp/fixture"
        shutil.rmtree(tmp, ignore_errors=True)
        shutil.copytree(src, tmp, symlinks=True)
        os.makedirs(os.path.join(tmp, "assets"), exist_ok=True)
        try:
            plant(tmp)
            got = protect.scan(tmp)
        except Exception as e:  # noqa: BLE001
            got = [{"level": "error", "name": str(e), "evidence": ""}]
        hit = any(x["level"] == level and part.lower() in x["name"].lower() for x in got)
        new = [x for x in got if f"{x['level']}: {x['name']}" not in clean]
        good = hit and not clean
        ok += good
        lines.append(f"| {name} | {which} | {'; '.join(clean) or 'none'} | {'; '.join(x['level'] + ': ' + x['name'] for x in new) or 'none'} | "
                     f"{'pass' if good else '**FAIL**'} |")
    lines.insert(2, f"**{ok}/{len(CASES)} planted signs flagged, clean apps unflagged.**\n")
    open("out/fixtures.md", "w").write("\n".join(lines) + "\n")
    print("\n".join(lines))


if __name__ == "__main__":
    main(*sys.argv[1:4])

"""Unzip an APK whose file names are UTF-8 without the zip's UTF-8 flag (Chinese names in dream-avg).
macOS unzip stops on them with "write error (disk full?)". Usage: python3 -I ci/cocos/unzip.py <apk> <dir>"""
import os, sys, zipfile
z = zipfile.ZipFile(sys.argv[1])
for i in z.infolist():
    n = i.filename
    if not i.flag_bits & 0x800:
        try: n = n.encode("cp437").decode("utf-8")
        except UnicodeError: pass
    p = os.path.normpath(os.path.join(sys.argv[2], n))
    if not p.startswith(os.path.normpath(sys.argv[2]) + os.sep) or n.endswith("/"): continue
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, "wb") as f: f.write(z.read(i))

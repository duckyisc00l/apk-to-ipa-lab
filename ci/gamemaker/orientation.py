"""Print "portrait" or "landscape" from an APK's binary AndroidManifest.xml (android:screenOrientation).

Usage: python3 -I ci/gamemaker/orientation.py <AndroidManifest.xml or .apk>
A GameMaker game's data file doesn't say which way the phone is held (its window size can be a 100x100
placeholder that the game resizes at run time); the manifest does. Prints "unknown" if it isn't set.
"""
import struct, sys, zipfile

SCREEN_ORIENTATION = 0x0101001E
PORTRAIT = {1, 7, 9, 12}      # portrait, sensorPortrait, reversePortrait, userPortrait
LANDSCAPE = {0, 6, 8, 11}     # landscape, sensorLandscape, reverseLandscape, userLandscape


def main(path):
    if path.endswith(".apk"):
        data = zipfile.ZipFile(path).read("AndroidManifest.xml")
    else:
        data = open(path, "rb").read()
    resmap, found = [], []
    i = 8
    while i + 8 <= len(data):
        ctype, hsize, size = struct.unpack("<HHI", data[i:i + 8])
        if size == 0:
            break
        if ctype == 0x0180:   # resource map: string index -> attribute resource id
            resmap = list(struct.unpack(f"<{(size - 8) // 4}I", data[i + 8:i + size]))
        elif ctype == 0x0102:  # start element
            start, asize, count = struct.unpack("<HHH", data[i + 24:i + 30])
            for a in range(count):
                o = i + 16 + start + a * asize
                _, name, _, _, _, typ, val = struct.unpack("<IIIHBBI", data[o:o + 20])
                if name < len(resmap) and resmap[name] == SCREEN_ORIENTATION:
                    found.append(val)
        i += size
    for v in found:
        if v in PORTRAIT:
            return "portrait"
        if v in LANDSCAPE:
            return "landscape"
    return "unknown"


print(main(sys.argv[1]))

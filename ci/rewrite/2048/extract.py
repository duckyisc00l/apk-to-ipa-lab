"""Pull the APK's own look into the iPhone app: colours, tile colours, texts, font, icons.

Usage: python3 -I extract.py <jadx output dir> <App/AppAssets dir> <App/Assets.xcassets dir>
Reads res/values/colors.xml + strings.xml and the tile drawables (cell_rectangle_<N>.xml: a <solid> colour)
from jadx's decoded resources, so nothing is retyped by hand.
"""
import glob, json, os, re, shutil, sys
from PIL import Image

dec, out, xcassets = sys.argv[1], sys.argv[2], sys.argv[3]
res = os.path.join(dec, "resources", "res")
os.makedirs(out, exist_ok=True)

def values(kind):
    d = {}
    for f in glob.glob(f"{res}/values/{kind}.xml"):
        for name, val in re.findall(rf'<{kind[:-1] if kind != "strings" else "string"} name="([^"]+)"[^>]*>([^<]*)<', open(f, encoding="utf-8").read()):
            d[name] = val
    return d

colors = values("colors")
def resolve(c):
    while c and c.startswith("@color/"):
        c = colors.get(c[7:], "")
    return c or "#000000"

def drawable_colour(name):
    for f in glob.glob(f"{res}/drawable*/{name}.xml"):
        m = re.search(r'<solid[^>]*android:color="([^"]+)"', open(f, encoding="utf-8").read())
        if m:
            return resolve(m.group(1))
    return None

cells = {}
for f in glob.glob(f"{res}/drawable*/cell_rectangle_*.xml"):
    n = re.search(r"cell_rectangle_(\d+)\.xml$", f)
    if n:
        cells[n.group(1)] = drawable_colour(f"cell_rectangle_{n.group(1)}")
big = sorted(int(k) for k in cells) or [2048]
cells["super"] = cells.get(str(big[-1]))   # beyond the last drawable the APK reuses the last colour
palette = {k: resolve(colors.get(k, "#000000")) for k in ("background", "text_black", "text_white", "text_brown", "status_background")}
palette.update(cells=cells, board=drawable_colour("background_rectangle") or "#bbada0", empty=drawable_colour("cell_rectangle") or "#cdc1b4")
json.dump(palette, open(os.path.join(out, "palette.json"), "w"), indent=1)

strings = {k: v.replace("\\'", "'") for k, v in values("strings").items()
           if not k.startswith(("abc_", "common_", "status_bar", "search_menu", "games_", "app_id"))}
json.dump(strings, open(os.path.join(out, "strings.json"), "w"), indent=1, ensure_ascii=False)

font = glob.glob(f"{dec}/resources/assets/*.ttf")
for f in font:
    shutil.copy(f, out)

dens = ["xxxhdpi", "xxhdpi", "xhdpi", "hdpi", "mdpi"]
def best(name):
    for d in dens:
        for f in glob.glob(f"{res}/drawable-{d}*/{name}.png") + glob.glob(f"{res}/mipmap-{d}*/{name}.png"):
            return f
for icon in ("ic_action_undo", "ic_action_refresh", "ic_action_new"):
    f = best(icon)
    if f:
        shutil.copy(f, os.path.join(out, icon + ".png"))

# app icon: largest launcher PNG, opaque 1024x1024 on the APK's own icon_background colour
src = best("ic_launcher") or best("logo_2048")
icondir = os.path.join(xcassets, "AppIcon.appiconset")
os.makedirs(icondir, exist_ok=True)
bg = resolve(colors.get("icon_background", palette["background"]))
im = Image.open(src).convert("RGBA")
canvas = Image.new("RGBA", im.size, tuple(int(bg.lstrip("#")[-6:][i:i + 2], 16) for i in (0, 2, 4)) + (255,))
canvas.alpha_composite(im)
canvas.convert("RGB").resize((1024, 1024), Image.LANCZOS).save(os.path.join(icondir, "icon-1024.png"))
json.dump({"images": [{"filename": "icon-1024.png", "idiom": "universal", "platform": "ios", "size": "1024x1024"}], "info": {"author": "xcode", "version": 1}},
          open(os.path.join(icondir, "Contents.json"), "w"))
json.dump({"info": {"author": "xcode", "version": 1}}, open(os.path.join(xcassets, "Contents.json"), "w"))
print(json.dumps({"palette": palette, "strings": len(strings), "font": [os.path.basename(f) for f in font],
                  "icons": sorted(os.listdir(out)), "app_icon_from": src}, indent=1))

"""Which native classes does the APK's Cocos2d-x engine register that the stock engine of the same version doesn't?
Games often add their own C++ classes for their scripts (dream-avg: ActionShake, Live2DSprite, captureNode...).
Those must be added to the iOS build too (from the game's source), or the scripts that call them fail.

Usage: python3 -I ci/cocos/bindings.py <engine .so> <stock engine dir> <game scripts dir>
"""
import os, re, sys

so, eng, scripts = sys.argv[1:4]
data = open(so, "rb").read()
# tolua type names compiled into the APK's engine ("cc.Sprite", "ccui.Button", "sp.SkeletonAnimation")
apk = {m.decode() for m in re.findall(rb"(?<![\w.])(?:cc|ccui|ccs|sp|ccb|ccexp|cc3d|db)\.[A-Z][A-Za-z0-9_]{2,40}(?![\w.])", data)}
stock = set()
for d in ("cocos/scripting/lua-bindings/auto", "cocos/scripting/lua-bindings/manual"):
    for root, _, fs in os.walk(os.path.join(eng, d)):
        for f in fs:
            if f.endswith((".cpp", ".hpp", ".h")):
                stock.update(re.findall(r'"((?:cc|ccui|ccs|sp|ccb|ccexp|cc3d|db)\.[A-Z]\w+)"', open(os.path.join(root, f), errors="ignore").read()))
# binding functions: their names stay in the .so inside error messages ("invalid 'cobj' in function 'lua_cocos2dx_ui_RichText_clear'"),
# so methods a game added to existing classes show up too
fn_apk = {m.decode() for m in re.findall(rb"lua_cocos2dx_[A-Za-z0-9_]+", data)}
fn_stock = set()
for root, _, fs in os.walk(os.path.join(eng, "cocos/scripting/lua-bindings")):
    for f in fs:
        if f.endswith((".cpp", ".hpp", ".h")):
            fn_stock.update(re.findall(r"lua_cocos2dx_[A-Za-z0-9_]+", open(os.path.join(root, f), errors="ignore").read()))
extra = sorted(apk - stock)
# global functions the scripts call that no Lua file defines (registered from C++ by the game)
lua = ""
for root, _, fs in os.walk(scripts):
    for f in fs:
        if f.endswith(".lua"):
            lua += open(os.path.join(root, f), errors="ignore").read() + "\n"
used = {u for u in extra if u.split(".", 1)[1] in lua}
print(f"# Native bindings\n\n- tolua classes in the APK's engine: {len(apk)}; in stock {os.path.basename(eng)}: {len(stock)}")
print(f"- only in the APK's engine (the game's own C++): {extra}")
print(f"- of those, used by the game's scripts: {sorted(used)}")
fx = sorted(fn_apk - fn_stock)
print(f"- binding functions only in the APK's engine ({len(fx)} of {len(fn_apk)}): {fx[:60]}")

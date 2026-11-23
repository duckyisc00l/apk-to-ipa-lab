#!/bin/bash
# Codemagic (Apple-chip Mac) version of route-cocos.yml's build + simulator steps, for the dream-avg test.
# Usage: ci/cocos/cm-sim.sh <arm64|x86_64> <luajit|lua51>     Results in out/ (SUMMARY in out/sim/sim.md)
set -u
ARCH=${1:-arm64}; ENGINE=${2:-luajit}
export APK_URL=https://github.com/re-esper/dream-avg/releases/download/0.1/Sakumai-release-signed.apk
export GAME_SRC=https://github.com/re-esper/dream-avg NAME=Sakumai NATIVE=game
export CCC_OVERRIDE_OPTIONS="^-Wno-error=implicit-function-declaration ^-Wno-error=incompatible-function-pointer-types ^-Wno-error=int-conversion ^-Wno-deprecated-declarations ^-DGLES_SILENCE_DEPRECATION"
export GITHUB_ENV=/tmp/genv; : > $GITHUB_ENV
cd "$(dirname "$0")/../.." && R=$PWD
sw_vers; xcodebuild -version; uname -m
step_env() { set -a; . $GITHUB_ENV; set +a; }
mkdir -p out apk && curl -sSL --fail -o game.apk "$APK_URL" && python3 -I ci/cocos/unzip.py game.apk apk
so=$(ls apk/lib/arm64-v8a/libcocos2d*.so apk/lib/armeabi-v7a/libcocos2d*.so 2>/dev/null | head -1); echo "SO=$so" >> $GITHUB_ENV
v=$(strings "$so" | grep -oE 'cocos2d-x-[0-9]+\.[0-9]+(\.[0-9]+)?' | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')
echo "COCOS_VERSION=$v" >> $GITHUB_ENV
{ echo "# Detect"; echo "- engine library: $so ($(du -h "$so" | cut -f1))"; echo "- version: $v"
  echo "- scripts: $(find apk/assets -name '*.lua' | wc -l) .lua, $(find apk/assets -name '*.luac' | wc -l) .luac, $(find apk/assets -name '*.js' | wc -l) .js, $(find apk/assets -name '*.jsc' | wc -l) .jsc"
  echo "- first bytes of main.lua: $(head -c 16 apk/assets/src/main.lua 2>/dev/null | xxd -p)"
  echo "- XXTEA key/sign near the setXXTEAKeyAndSign strings (default is 2dxLua/XXTEA):"; strings "$so" | grep -n -B2 -A2 -E '^XXTEA$' | head -8
  echo "- assets/: $(ls apk/assets | tr '\n' ' ')"; } | tee out/cocos.md

step_env
git clone -q --depth 1 --branch "$COCOS_VERSION" https://github.com/cocos2d/cocos2d-x engine 2>&1 | tail -1
dep=$(python3 -c "import json;print(json.load(open('engine/external/config.json'))['version'])")
curl -sSL --fail -o deps.zip "https://github.com/cocos2d/cocos2d-x-3rd-party-libs-bin/archive/$dep.zip" && unzip -qo deps.zip -d deps
cp -R deps/*/. engine/external/ && rm -rf deps deps.zip; echo "- third-party libs: $dep" | tee -a out/cocos.md
lipo -info engine/external/lua/luajit/prebuilt/ios/libluajit.a | tee -a out/cocos.md
ci/cocos/retag-sim.sh engine; ci/cocos/retag-sim-arm64.sh engine | tee -a out/cocos.md
python3 -I ci/cocos/bindings.py "$SO" engine apk/assets/src | tee -a out/cocos.md

export LC_ALL=C   # BSD sed stops on engine files that aren't UTF-8 ("illegal byte sequence")
cp -R engine/templates/lua-template-default proj && mv engine proj/frameworks/cocos2d-x
rm -rf proj/src proj/res && cp -R apk/assets/src apk/assets/res proj/ && { [ -f apk/assets/config.json ] && cp apk/assets/config.json proj/ || true; }
if [ "$NATIVE" = game ]; then
  git clone -q --depth 1 "$GAME_SRC" gamesrc
  cp -R gamesrc/cocos2d-x-patch/cocos2d-x/. proj/frameworks/cocos2d-x/
  C=proj/frameworks/runtime-src/Classes
  for f in gamesrc/cocos2d-x-patch/runtime-src/Classes/*; do case "$f" in *LuaConsole*) ;; *) cp "$f" $C/;; esac; done
  # Live2D's Cubism SDK isn't open source and isn't in the repo: build without it
  sed -i '' 's/#define USE_LIVE2D_SPRITE 1/#define USE_LIVE2D_SPRITE 0/' $C/AppDelegate.cpp
  # the template's Xcode project only compiles AppDelegate.cpp: pull the game's other .cpp files in through it
  # ActionShake.h defines macros B and BM, which break rapidjson's templates in the next file: undefine them after each one
  for f in $C/*.cpp; do b=$(basename $f); [ $b = AppDelegate.cpp ] || printf '#include "%s"\n#undef B\n#undef BM\n' "$b" >> $C/AppDelegate.cpp; done
  echo "- native: the game's own C++ added ($(ls $C | tr '\n' ' ')); Live2D left out" | tee -a out/cocos.md
else echo "- native: stock engine" | tee -a out/cocos.md; fi
# Xcode 16 clang: bullet's SSE shuffle masks must fit in 8 bits (bt_splat_ps(y, 0x80) gives 10880); older clang cut them down silently
find proj/frameworks/cocos2d-x/external/bullet -name '*.h' -exec sed -i '' -E 's/^#define BT_SHUFFLE\(x,y,z,w\) \(\(w\)<<6 \| \(z\)<<4 \| \(y\)<<2 \| \(x\)\)/#define BT_SHUFFLE(x,y,z,w) (((w)<<6 | (z)<<4 | (y)<<2 | (x)) \& 0xff)/' {} +
grep -rh '^#define BT_SHUFFLE' proj/frameworks/cocos2d-x/external/bullet | sort -u | tee -a out/cocos.md
# the game's patched UIRichText.cpp calls bind() unqualified; Xcode 16's libc++ needs std::bind
sed -i '' -E 's/([^:a-z_])bind\(&RichText/\1std::bind(\&RichText/' proj/frameworks/cocos2d-x/cocos/ui/UIRichText.cpp
# Xcode 16's SDK makes iconv_t a typed pointer: CCFontAtlas keeps it as void*, so cast it back
sed -i '' -E 's/iconv_close\(_iconv\)/iconv_close((iconv_t)_iconv)/; s/iconv\(_iconv,/iconv((iconv_t)_iconv,/' proj/frameworks/cocos2d-x/cocos/2d/CCFontAtlas.cpp
grep -n 'iconv_t)_iconv' proj/frameworks/cocos2d-x/cocos/2d/CCFontAtlas.cpp | tee -a out/cocos.md
# the template and libsimulator set VALID_ARCHS to arm64/armv7: a simulator build then compiles nothing and "succeeds" with no executable
find proj -name project.pbxproj -exec sed -i '' -E '/VALID_ARCHS = /d' {} +
# Release builds drop CCLOG, so Lua load errors are silent: print them with cocos2d::log (stdout) instead
M=proj/frameworks/cocos2d-x/cocos/scripting/lua-bindings/manual
sed -i '' 's/CCLOG(/cocos2d::log(/g' $M/CCLuaStack.cpp $M/Cocos2dxLuaLoader.cpp
sed -i '' 's/    if (engine->executeScriptFile("main.lua"))/    cocos2d::log("lab: running main.lua"); if (engine->executeScriptFile("main.lua"))/' proj/frameworks/runtime-src/Classes/AppDelegate.cpp
grep -c 'lab: running main.lua' proj/frameworks/runtime-src/Classes/AppDelegate.cpp | sed 's/^/- main.lua log line added: /' | tee -a out/cocos.md
# lab probes (black screen, timer never fires): trace requires, and log the main loop, the app's active state and the GL context
{ printf '%s\n' 'print = release_print' 'local _req = require' 'require = function(m) release_print("lab: require " .. tostring(m)); local r = _req(m); release_print("lab: required " .. tostring(m)); return r end'; cat proj/src/main.lua; } > /tmp/main.lua && mv /tmp/main.lua proj/src/main.lua
python3 -I - proj/frameworks/cocos2d-x/cocos proj/frameworks/runtime-src/Classes/AppDelegate.cpp <<'PY' | tee -a out/cocos.md
import sys
c, ad = sys.argv[1], sys.argv[2]
def sub(f, a, b):
    t = open(f, encoding='latin-1').read(); n = t.count(a); open(f, 'w', encoding='latin-1').write(t.replace(a, b, 1)); print('- probe', f.split('/')[-1], n)
sub(c + '/base/CCDirector.cpp', 'void Director::mainLoop()\n{', 'void Director::mainLoop()\n{\n    static int labN = 0; if (labN++ % 300 == 0) cocos2d::log("lab: Director::mainLoop call %d", labN);')
sub(c + '/platform/ios/CCDirectorCaller-ios.mm', '-(void) doCaller: (id) sender\n{', '-(void) doCaller: (id) sender\n{\n    static int labN = 0; if (labN++ % 120 == 0) printf("lab: doCaller %d isAppActive %d appState %d\\n", labN, (int)isAppActive, (int)[UIApplication sharedApplication].applicationState); fflush(stdout);')
sub(c + '/platform/ios/CCDirectorCaller-ios.mm', '    isAppActive = YES;\n}', '    isAppActive = YES;\n    printf("lab: appDidBecomeActive\\n"); fflush(stdout);\n}')
sub(c + '/platform/ios/CCDirectorCaller-ios.mm', '-(void) startMainLoop\n{', '-(void) startMainLoop\n{\n    printf("lab: startMainLoop\\n"); fflush(stdout);')
sub(c + '/platform/ios/CCES2Renderer-ios.m', '        if (!context_ || ![EAGLContext setCurrentContext:context_] )', '        printf("lab: EAGLContext %p\\n", context_); fflush(stdout);\n        if (!context_ || ![EAGLContext setCurrentContext:context_] )')
sub(ad, 'if (engine->executeScriptFile("main.lua"))', 'int labRet = engine->executeScriptFile("main.lua"); cocos2d::log("lab: main.lua returned %d", labRet);\n    if (labRet)')
PY
# Xcode 16 refuses iOS 6-8 deployment targets
find proj -name project.pbxproj -exec sed -i '' -E 's/IPHONEOS_DEPLOYMENT_TARGET = [0-9.]+;/IPHONEOS_DEPLOYMENT_TARGET = 12.0;/' {} +
xcodebuild -list -project proj/frameworks/runtime-src/proj.ios_mac/HelloLua.xcodeproj | tee -a out/cocos.md

# ---- simulator build and run
if [ "$ARCH" = x86_64 ]; then export SIM_XCODE_ARGS='OTHER_LDFLAGS="\$(inherited) -pagezero_size 10000 -image_base 100000000"'; fi
SIM_ARCHS=$ARCH SIM_PRE_RUN='/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.duckyisc00l.sakumai" "$APP/Info.plist"; du -sh "$APP"' \
  ci/sim/build-and-run.sh "$R/proj/frameworks/runtime-src/proj.ios_mac/HelloLua.xcodeproj" HelloLua-mobile out/sim 60 || true
grep -E 'error:|ld: ' out/sim/sim-build.log 2>/dev/null | sort -u | head -30 > out/sim-link-errors.log; tail -60 out/sim/sim-build.log > out/sim-build-tail.log 2>/dev/null
rm -f out/sim/sim-build.log
head -3 out/sim/sim.md; tail -5 out/sim/sim-console.log

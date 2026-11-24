#!/bin/bash
# Build LÖVE 11.5 for the iOS Simulator and run the text probe with the keyboard shim (B). Usage: ci/love/input-test.sh [plain]
# Works on any Mac (Codemagic runs it through ci/cm/run.sh). Results in out/.
set -u
ROOT=$PWD; mkdir -p out
command -v axe >/dev/null || { brew update --quiet >/dev/null 2>&1; brew tap cameroncooke/axe >/dev/null 2>&1; { brew trust cameroncooke/axe 2>/dev/null; brew install cameroncooke/axe/axe; } > out/axe-install.log 2>&1; command -v axe; }
git clone -q --depth 1 --branch 11.5 https://github.com/love2d/love love 2>&1 | tail -1
url=https://github.com/love2d/love/releases/download/11.5/love-11.5-apple-libraries.zip
curl -sSL -o apple.zip "$url" && unzip -qo apple.zip -d applelibs
src=$(find applelibs -maxdepth 3 -type d -path '*iOS/libraries' | head -1)
mkdir -p love/platform/xcode/ios && cp -R "$src" love/platform/xcode/ios/
(cd ci/love/textprobe && zip -qr "$ROOT/probe.love" .)
if [ "${1:-}" = plain ]; then g=probe.love; else ci/love/shim.sh probe.love probe-shim.love; g=probe-shim.love; fi
export SIM_PRE_RUN='/usr/libexec/PlistBuddy -c "Delete :UISupportedInterfaceOrientations" -c "Add :UISupportedInterfaceOrientations array" -c "Add :UISupportedInterfaceOrientations:0 string UIInterfaceOrientationPortrait" "$APP/Info.plist"; cp '"$ROOT/$g"' "$APP/game.love"'
ci/sim/build-and-run.sh love/platform/xcode/love.xcodeproj love-ios out/B-shim 20 ci/sim/steps/textprobe-kb.txt
grep -E '^(TI|KP):' out/B-shim/sim-console.log out/B-shim/sim-applog.log | tee out/events.txt
find out -name '*.mp4*' -o -name '*.mov' | xargs rm -f

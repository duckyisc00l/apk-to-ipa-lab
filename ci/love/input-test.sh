#!/bin/bash
# Build LÖVE 11.5 for the iOS Simulator and run the text probe with the keyboard shim (B). Usage: ci/love/input-test.sh [plain]
# Works on any Mac (Codemagic runs it through ci/cm/run.sh). Results in out/.
set -u
ROOT=$PWD; mkdir -p out
command -v axe >/dev/null || { brew update --quiet >/dev/null 2>&1; brew tap cameroncooke/axe >/dev/null 2>&1; brew install cameroncooke/axe/axe > out/axe-install.log 2>&1; tail -3 out/axe-install.log; }
git clone -q --depth 1 --branch 11.5 https://github.com/love2d/love love 2>&1 | tail -1
url=$(curl -sSL https://api.github.com/repos/love2d/love/releases/tags/11.5 | python3 -c "import json,sys;print([a['browser_download_url'] for a in json.load(sys.stdin)['assets'] if 'apple-libraries' in a['name']][0])")
curl -sSL -o apple.zip "$url" && unzip -qo apple.zip -d applelibs
src=$(find applelibs -maxdepth 3 -type d -path '*iOS/libraries' | head -1)
mkdir -p love/platform/xcode/ios && cp -R "$src" love/platform/xcode/ios/
(cd ci/love/textprobe && zip -qr "$ROOT/probe.love" .)
if [ "${1:-}" = plain ]; then g=probe.love; else ci/love/shim.sh probe.love probe-shim.love; g=probe-shim.love; fi
export SIM_PRE_RUN='/usr/libexec/PlistBuddy -c "Delete :UISupportedInterfaceOrientations" -c "Add :UISupportedInterfaceOrientations array" -c "Add :UISupportedInterfaceOrientations:0 string UIInterfaceOrientationPortrait" "$APP/Info.plist"; cp '"$ROOT/$g"' "$APP/game.love"'
ci/sim/build-and-run.sh love/platform/xcode/love.xcodeproj love-ios out/B-shim 20 ci/sim/steps/textprobe-kb.txt
grep -E '^(TI|KP):' out/B-shim/sim-console.log out/B-shim/sim-applog.log | tee out/events.txt
find out -name '*.mp4*' -o -name '*.mov' | xargs rm -f

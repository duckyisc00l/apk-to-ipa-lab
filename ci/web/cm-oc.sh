#!/bin/bash
# OpenChess (web route) on a Codemagic Mac: APK from the repo's public releases, make.py, then the simulator with the steps file.
# Usage: ci/cm/run.sh ci/web/cm-oc.sh "jupiutrera/open-chess:OpenChess" <dir>
set -u
python3 -m venv /tmp/v && /tmp/v/bin/pip install -q androguard pillow > /dev/null 2>&1
brew install xcodegen > /dev/null 2>&1
SE=$(xcrun simctl list devices available | grep -q "iPhone SE" && echo "iPhone SE" || echo "")
for spec in "$@"; do
  repo=${spec%%:*}; name=${spec##*:}; o=out/$name
  rm -rf dl work proj; mkdir -p dl/x "$o"
  url=""; for try in 1 2 3 4; do
    url=$(curl -sS "https://api.github.com/repos/$repo/releases" | python3 -c 'import json,sys; r=json.load(sys.stdin); print(next(a["browser_download_url"] for x in r for a in x["assets"] if a["name"].lower().endswith(".apk")))' 2>/dev/null) && [ -n "$url" ] && break; sleep 20; done
  [ -n "$url" ] || url="https://github.com/$repo/releases/download/v0.9.1/open-chess-v0.9.1.apk"   # API rate-limited: last known release
  curl -sSL "$url" -o dl/x/app.apk; ls -la dl/x > "$o/apk.txt"
  /tmp/v/bin/python ci/detect.py dl work > "$o/detect.txt" 2>&1
  /tmp/v/bin/python ci/web/make.py dl/x/app.apk "$(ls -d work/*/ | head -1)" proj "com.duckyisc00l.$(echo "$name" | tr A-Z a-z)" > "$o/make.md" 2>&1
  (cd proj && xcodegen generate > /dev/null 2>&1)
  find proj/App/www -type f | head -80 > "$o/www-files.txt"; du -sh proj/App/www >> "$o/www-files.txt"
  SIM_DEVICE="$SE" ci/sim/build-and-run.sh proj/App.xcodeproj App "$o/sim" 20 "$PWD/ci/sim/steps/$name.txt"
done

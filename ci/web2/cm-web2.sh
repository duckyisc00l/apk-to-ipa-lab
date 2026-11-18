#!/bin/bash
# web2 on a Codemagic Mac (no GitHub queue, no GitHub token): ci/cm/run.sh ci/web2/cm-web2.sh "owner/repo:Name ..." <dir>
# APK from the repo's public releases, then make.py + engine.py, then the simulator with ci/web2/steps/<Name>.txt.
set -u
python3 -m venv /tmp/v && /tmp/v/bin/pip install -q androguard pillow > /dev/null 2>&1
brew install xcodegen > /dev/null 2>&1
SE=$(xcrun simctl list devices available | grep -q "iPhone SE" && echo "iPhone SE" || echo "")
for spec in "$@"; do
  repo=${spec%%:*}; name=${spec##*:}; o=out/$name
  rm -rf dl work proj; mkdir -p dl/x "$o"
  url=$(curl -sS "https://api.github.com/repos/$repo/releases" | python3 -c 'import json,sys; r=json.load(sys.stdin); print(next(a["browser_download_url"] for x in r for a in x["assets"] if a["name"].lower().endswith(".apk")))')
  curl -sSL "$url" -o dl/x/app.apk; ls -la dl/x > "$o/apk.txt"
  /tmp/v/bin/python ci/detect.py dl work > "$o/detect.txt" 2>&1
  /tmp/v/bin/python ci/web/make.py dl/x/app.apk "$(ls -d work/*/ | head -1)" proj "com.duckyisc00l.$(echo "$name" | tr A-Z a-z)" > "$o/make.md" 2>&1
  /tmp/v/bin/python -I ci/web2/engine.py proj > "$o/engine.md" 2>&1
  (cd proj && xcodegen generate > /dev/null 2>&1)
  steps="$PWD/ci/web2/steps/$name.txt"
  SIM_DEVICE="$SE" SIM_AXE_VERSION=$(grep -m1 -oE '^# axe: v[0-9.]+' "$steps" | cut -d' ' -f3) \
    ci/sim/build-and-run.sh proj/App.xcodeproj App "$o/sim" 20 "$steps"
done

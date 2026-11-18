#!/bin/bash
# Run a lab script on a Codemagic Mac and fetch its results.
# Usage: ci/cm/run.sh <script path in the repo> "<args>" <local result dir> [branch]
# Waits up to 2.5 h. Results: <dir>/status.txt, and every artifact file from out/ unzipped into <dir>.
set -u
script=$1; args=${2:-}; dest=$3; branch=${4:-main}
tok=$(cat ~/.cm/token); api=https://api.codemagic.io; app=6afce85b3ffc61516662c82e
mkdir -p "$dest"
body=$(python3 -c 'import json,sys; print(json.dumps({"appId":sys.argv[1],"workflowId":"mac-script","branch":sys.argv[2],"environment":{"variables":{"CM_SCRIPT":sys.argv[3],"CM_ARGS":sys.argv[4]}}}))' "$app" "$branch" "$script" "$args")
id=$(curl -sS -H "x-auth-token: $tok" -H 'Content-Type: application/json' -d "$body" $api/builds | python3 -c 'import json,sys; print(json.load(sys.stdin).get("buildId",""))')
[ -n "$id" ] || { echo "start failed" | tee "$dest/status.txt"; exit 1; }
echo "codemagic build $id"
for i in $(seq 1 300); do
  st=$(curl -sS -H "x-auth-token: $tok" $api/builds/$id | python3 -c 'import json,sys; print(json.load(sys.stdin)["build"]["status"])')
  case "$st" in finished|failed|canceled|timeout|skipped) break;; esac
  sleep 30
done
echo "build $id: $st" > "$dest/status.txt"
curl -sS -H "x-auth-token: $tok" $api/builds/$id | python3 -c '
import json,sys
b=json.load(sys.stdin)["build"]
for a in b.get("artefacts",[]): print(a["url"])' | while read -r u; do
  f="$dest/$(basename "$u")"; curl -sS -L -H "x-auth-token: $tok" "$u" -o "$f"
  case "$f" in *.zip) (cd "$dest" && unzip -qo "$(basename "$f")");; esac
done
cat "$dest/status.txt"; ls "$dest" | head -30

#!/usr/bin/env bash
# Skill step U2 test: run AssetRipper headless on every Unity game found by detect.py
# and summarise what came back. Game files never leave the runner; only summaries do.
set -u
mkdir -p out tools
cd tools
url=$(curl -sSL -H "Authorization: Bearer $GH_TOKEN" https://api.github.com/repos/AssetRipper/AssetRipper/releases/latest \
  | python3 -c "import json,sys; r=json.load(sys.stdin); print(r['tag_name'], file=sys.stderr); print([a['browser_download_url'] for a in r['assets'] if 'linux_x64' in a['name'].lower()][0])")
echo "AssetRipper: $url" | tee ../out/ripper-version.txt
# Releases have been .zip and, from 2.0, .tar.xz.
mkdir -p ar
case "$url" in
  *.zip) curl -sSL -o ar.pkg "$url" && unzip -qo ar.pkg -d ar ;;
  *.tar.*|*.tgz) curl -sSL "$url" | tar -xJ -C ar 2>/dev/null || { curl -sSL -o ar.pkg "$url" && tar -xf ar.pkg -C ar; } ;;
esac
find ar -maxdepth 3 -type f ! -name '*.dll' ! -name '*.so' ! -name '*.json' ! -name '*.pdb' | head -20 > ../out/ripper-files.txt
BIN=$(find "$PWD/ar" -maxdepth 3 -type f -name 'AssetRipper*' ! -name '*.dll' ! -name '*.json' ! -name '*.pdb' ! -name '*.so' | head -1)
echo "binary: $BIN" >> ../out/ripper-version.txt
chmod +x "$BIN"
"$BIN" --help > ../out/ripper-help.txt 2>&1 || true
cd ..
PORT=8999
"$BIN" --port $PORT --headless > out/ripper-server.log 2>&1 &
SRV=$!
for i in $(seq 60); do curl -s -o /dev/null "http://127.0.0.1:$PORT/" && break; sleep 2; done
curl -s "http://127.0.0.1:$PORT/" | head -c 400 > out/ripper-home.txt

python3 - <<'E' > out/unity-games.txt
import json
for r in json.load(open("out/detect.json")):
    if r.get("engine") == "Unity":
        print(r["game"], r["root"], r.get("backend", ""))
E

# AssetRipper's web API takes a form field "Path"; try url-encoded form first, then JSON.
post() {
  local label=$1 ep=$2 val=$3 tmo=$4 code
  code=$(curl -s -o /tmp/resp -w "%{http_code}" -X POST --data-urlencode "Path=$val" "http://127.0.0.1:$PORT/$ep" --max-time "$tmo")
  if [ "$code" = "415" ] || [ "$code" = "400" ]; then
    code=$(curl -s -o /tmp/resp -w "%{http_code}" -X POST -H 'Content-Type: application/json' \
      --data "{\"path\":\"$val\"}" "http://127.0.0.1:$PORT/$ep" --max-time "$tmo")
    echo "$label $code (json) $(head -c 200 /tmp/resp)"
  else
    echo "$label $code (form) $(head -c 200 /tmp/resp)"
  fi
}

while read -r game root backend; do
  [ -z "$game" ] && continue
  dest="$PWD/export/$game"
  rm -rf "$dest"; mkdir -p "$dest"
  t0=$(date +%s)
  post load LoadFolder "$PWD/$root" 1800 >> "out/ripper-$game.txt"
  post export Export/UnityProject "$dest" 3600 >> "out/ripper-$game.txt"
  t1=$(date +%s)
  {
    echo "backend: $backend"
    echo "seconds: $((t1 - t0))"
    proj=$(find "$dest" -maxdepth 2 -type d -name ExportedProject | head -1)
    echo "project: ${proj:-none}"
    if [ -n "$proj" ]; then
      echo "files: $(find "$proj" -type f | wc -l)"
      echo "scenes: $(find "$proj/Assets" -name '*.unity' | wc -l)"
      echo "textures: $(find "$proj/Assets" -iname '*.png' | wc -l)"
      echo "audio: $(find "$proj/Assets" \( -iname '*.ogg' -o -iname '*.wav' -o -iname '*.mp3' \) | wc -l)"
      echo "game scripts (.cs under Assets/Scripts): $(find "$proj/Assets/Scripts" -name '*.cs' 2>/dev/null | wc -l)"
      echo "script folders: $(ls "$proj/Assets/Scripts" 2>/dev/null | tr '\n' ' ')"
      echo "stub bodies (throw null / NotImplemented): $(grep -rhoE 'throw null|NotImplementedException' "$proj/Assets/Scripts" 2>/dev/null | wc -l)"
      echo "ProjectVersion: $(cat "$proj/ProjectSettings/ProjectVersion.txt" 2>/dev/null | head -1)"
      echo "packages: $(python3 -c "import json;print(' '.join(json.load(open('$proj/Packages/manifest.json'))['dependencies']))" 2>/dev/null)"
      echo "android plugins: $(ls "$proj/Assets/Plugins/Android" 2>/dev/null | tr '\n' ' ')"
      echo "--- sample script (first 60 lines of the biggest game script)"
      big=$(find "$proj/Assets/Scripts" -path "*Unity*" -prune -o -name '*.cs' -printf '%s %p\n' 2>/dev/null | sort -rn | head -1 | cut -d' ' -f2-)
      [ -n "$big" ] && { echo "$big"; head -60 "$big"; }
    fi
  } >> "out/ripper-$game.txt"
  curl -s -o /dev/null -X POST "http://127.0.0.1:$PORT/Reset" || true
done < out/unity-games.txt

tail -60 out/ripper-server.log > out/ripper-server-tail.log
kill $SRV 2>/dev/null || true

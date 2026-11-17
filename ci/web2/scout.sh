#!/bin/bash
# Find HTML5-engine (RPG Maker, GDevelop, Construct, Phaser) and Flutter APKs in candidate repos' releases,
# download each and name the engine from its files. Writes out/scout.md.
set -u
mkdir -p out dl
echo "| repo | licence | tag | asset | MB | engine signs |" > out/scout.md; echo "|---|---|---|---|---|---|" >> out/scout.md
grep -v '^#' "$1" | while read -r r; do
  [ -n "$r" ] || continue
  lic=$(gh api "repos/$r" --jq '.license.spdx_id // "none"' 2>/dev/null || echo "?")
  line=$(gh api "repos/$r/releases?per_page=15" --jq '[.[] as $x|$x.assets[]|select(.name|test("\\.(apk|xapk|apks)$";"i"))|"\($x.tag_name) \(.name) \(.size) \(.browser_download_url)"]|.[0] // ""' 2>/dev/null)
  if [ -z "$line" ]; then
    # some games keep a built APK in the repo itself
    p=$(gh api "repos/$r/git/trees/HEAD?recursive=1" --jq '[.tree[]|select(.path|test("\\.apk$";"i"))|"\(.path) \(.size)"]|.[0] // ""' 2>/dev/null)
    echo "| $r | $lic | - | ${p:-no apk} | | |" >> out/scout.md; continue
  fi
  set -- $line; tag=$1; name=$2; size=$3; url=$4
  d=dl/$(echo $r | tr / _); mkdir -p $d
  sig=""
  if [ "$size" -lt 300000000 ] && curl -sSLf -o "$d/$name" "$url"; then
    l=$(unzip -l "$d/$name" 2>/dev/null | awk '{print $4}')
    echo "$l" | grep -q 'rpg_core.js' && sig="$sig RPGMakerMV"
    echo "$l" | grep -q 'rmmz_core.js' && sig="$sig RPGMakerMZ"
    echo "$l" | grep -qE 'c3runtime|c2runtime|scripts/main.js' && sig="$sig Construct?"
    echo "$l" | grep -qiE 'gdjs|pixi-renderers|runtimegame' && sig="$sig GDevelop"
    echo "$l" | grep -qi 'phaser' && sig="$sig Phaser"
    echo "$l" | grep -q 'libapp.so' && sig="$sig Flutter"
    echo "$l" | grep -q 'assets/www/index.html' && sig="$sig cordova"
    echo "$l" | grep -q 'capacitor.config.json' && sig="$sig capacitor"
    [ -z "$sig" ] && grep -l phaser -r "$d" >/dev/null 2>&1
    echo "$l" | grep -E '^assets/' | sed 's#/[^/]*$##' | sort | uniq -c | sort -rn | head -6 > "$d/dirs.txt"
    if [ -z "$sig" ]; then unzip -qo "$d/$name" 'assets/*' -d "$d/x" 2>/dev/null; grep -rlis 'phaser' "$d/x" | head -2 | grep -q . && sig="Phaser(js)"; grep -rlis 'gdjs' "$d/x" | head -1 | grep -q . && sig="$sig GDevelop(js)"; rm -rf "$d/x"; fi
  fi
  echo "| $r | $lic | $tag | $name | $((size/1048576)) | $sig |" >> out/scout.md
  { echo "### $r"; cat "$d/dirs.txt" 2>/dev/null; } >> out/dirs.md
done
cat out/scout.md

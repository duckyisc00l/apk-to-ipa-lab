#!/bin/bash
# Turn every classes*.dex of an unpacked APK back into Java bytecode, one jar: ci/libgdx/dex2jar.sh <unpacked apk> <out.jar>
# Uses ThexXTURBOXx/dex2jar (maintained fork; reads newer dex versions), downloaded from its GitHub release.
set -eu
ROOT="$1"; OUT="$(cd "$(dirname "$2")" && pwd)/$(basename "$2")"
T=/tmp/d2j; mkdir -p $T
if [ ! -d $T/x ]; then
  gh release download -R ThexXTURBOXx/dex2jar -p '*.zip' -D $T/zip --clobber
  unzip -qo $T/zip/*.zip -d $T/x
fi
D2J=$(find $T/x -name d2j-dex2jar.sh | head -1); chmod +x "$(dirname "$D2J")"/*.sh "$(dirname "$D2J")"/bin/* 2>/dev/null || true
rm -rf $T/parts $T/merge; mkdir -p $T/parts $T/merge
for d in "$ROOT"/classes*.dex; do
  "$D2J" --force -o "$T/parts/$(basename "$d" .dex).jar" "$d" 2>&1 | grep -vE "^dex2jar " | tail -3
done
for j in $T/parts/*.jar; do (cd $T/merge && unzip -qo "$j"); done
rm -f "$OUT"; (cd $T/merge && zip -qr "$OUT" . -x 'META-INF/*')
echo "dex2jar: $(ls "$ROOT"/classes*.dex | wc -l) dex files -> $(unzip -l "$OUT" | grep -c '\.class$') classes"

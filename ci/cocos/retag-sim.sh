#!/bin/bash
# Old Cocos2d-x prebuilt iOS libraries (LuaJIT in v3-deps) have an x86_64 slice whose objects are marked macOS.
# Xcode 15+ refuses them for the iPhone Simulator. Mark those objects iOS-simulator (platform 7) with vtool.
# Usage: ci/cocos/retag-sim.sh <engine dir>
set -u
for lib in $(find "$1/external" -path '*prebuilt/ios*' -name '*.a'); do
  lipo -archs "$lib" 2>/dev/null | grep -qw x86_64 || continue
  t=$(mktemp -d); lipo -thin x86_64 "$lib" -output "$t/x.a" 2>/dev/null || cp "$lib" "$t/x.a"
  (cd "$t" && mkdir o && cd o && ar x ../x.a 2>/dev/null)
  n=0; bad=0
  for o in "$t"/o/*.o; do
    if otool -l "$o" | grep -qE 'LC_VERSION_MIN_MACOSX|platform 1$'; then
      vtool -set-build-version 7 12.0 12.0 -replace -output "$o.new" "$o" 2>"$t/err" && mv "$o.new" "$o" && n=$((n+1)) || { bad=$((bad+1)); head -1 "$t/err"; }
    fi
  done
  if [ $n -gt 0 ]; then
    members=$(ar t "$t/x.a" | grep -c '\.o$'); files=$(ls "$t"/o/*.o | wc -l | tr -d ' ')
    libtool -static -o "$t/new.a" "$t"/o/*.o 2>/dev/null
    if lipo -archs "$lib" | grep -q ' '; then lipo "$lib" -replace x86_64 "$t/new.a" -output "$lib"; else cp "$t/new.a" "$lib"; fi
    echo "- simulator retag: $(basename "$lib"): $n objects marked iOS simulator, $bad failed (archive members $members, extracted $files)"
  fi
  rm -rf "$t"
done

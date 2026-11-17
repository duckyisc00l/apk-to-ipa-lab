#!/bin/bash
# Run Bim!'s client against its own server on this machine (step O), no internet.
# Usage: bim_play.sh <bim source> <build dir> <out dir> <tag> [ui script]
# Writes <out>/client-<tag>.log and screenshots <out>/<tag>-*.png. Exit code = the client's.
src=$1; B=$2; out=$3; tag=$4; script=${5:-}
mkdir -p "$out" "/tmp/shots-$tag" "/tmp/app-$tag"
args=("$B/apps/linux/bim" --assets "$src/static-assets/" "$B/assets/generated/" --console-log --app-dir "/tmp/app-$tag")
[ -n "$script" ] && args+=(--script "$script" --script-step-timeout 120)
cd "/tmp/shots-$tag"
# Screen = the game's default window (pixel3a, 1080x2220). gdb only prints a backtrace if it crashes.
# NO_GDB=1 for sanitizer builds (ASan prints its own report).
dbg=(gdb -q -batch -return-child-result -ex 'handle SIGPIPE nostop noprint' -ex run -ex 'thread apply all bt 12' --args)
[ -n "${NO_GDB:-}" ] && dbg=()
xvfb-run -a -s "-screen 0 1080x2220x24" timeout 900 "${dbg[@]}" "${args[@]}" > "$out/client-$tag.log" 2>&1
rc=$?
for f in *.png; do [ -f "$f" ] && cp "$f" "$out/$tag-$f"; done
echo "client $tag exit $rc; screenshots: $(ls *.png 2>/dev/null | tr '\n' ' ')"
exit $rc

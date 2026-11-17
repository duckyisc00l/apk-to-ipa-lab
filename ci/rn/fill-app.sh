#!/bin/bash
# Put the APK's React Native bundle, images and icon fonts into a built host .app (phone or simulator build).
# Usage: ci/rn/fill-app.sh <.app> <rn dir from inspect.py> <Host dir> <kind: hermes|plain JS>
set -e
app="$1"; rn="$2"; host="$3"; kind="$4"
if [ "$kind" = hermes ]; then cp "$rn/main.jsbundle" "$app/main.jsbundle"   # bytecode: can't put JS in front
else cat "$rn/prelude.js" "$rn/main.jsbundle" > "$app/main.jsbundle"; fi
# react-native-vector-icons draws with fonts that iOS must load from the app (UIAppFonts)
vi="$host/node_modules/react-native-vector-icons/Fonts"
if [ -d "$vi" ]; then
  cp "$vi"/*.ttf "$app/"; i=0
  plutil -remove UIAppFonts "$app/Info.plist" 2>/dev/null || true; plutil -insert UIAppFonts -array "$app/Info.plist"
  for f in "$vi"/*.ttf; do plutil -insert UIAppFonts.$i -string "$(basename "$f")" "$app/Info.plist"; i=$((i+1)); done
  echo "icon fonts: $i"
fi
[ -d "$rn/app" ] && cp -R "$rn/app/." "$app/"
echo "filled $app"

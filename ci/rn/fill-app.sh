#!/bin/bash
# Put the APK's React Native bundle, images and icon fonts into a built host .app (phone or simulator build).
# Usage: ci/rn/fill-app.sh <.app> <rn dir from inspect.py> <Host dir> <kind: hermes|plain JS> [bundle id] [home-screen name]
set -e
app="$1"; rn="$2"; host="$3"; kind="$4"
if [ "$kind" = hermes ]; then cp "$rn/main.jsbundle" "$app/main.jsbundle"   # bytecode: can't put JS in front,
  # so the host (patched by hermes-prelude.py) runs prelude.js itself before the bundle
  { [ -n "${RN_TRACE:-}" ] && echo "globalThis.__RN_TRACE=1;"; cat "$rn/prelude.js"; } > "$app/prelude.js"
else { [ -n "${RN_TRACE:-}" ] && echo "globalThis.__RN_TRACE=1;"; cat "$rn/prelude.js" "$rn/main.jsbundle"; } > "$app/main.jsbundle"; fi
# icon fonts iOS must load from the app (UIAppFonts): the host's react-native-vector-icons fonts, then the APK's
# own fonts (rn/fonts) over them, since only those match the glyph maps inside the bundle
vi="$host/node_modules/react-native-vector-icons/Fonts"
[ -d "$vi" ] && cp "$vi"/*.ttf "$app/"
[ -d "$rn/fonts" ] && cp "$rn/fonts/"* "$app/"
if [ -d "$vi" ] || [ -d "$rn/fonts" ]; then
  i=0; plutil -remove UIAppFonts "$app/Info.plist" > /dev/null 2>&1 || true; plutil -insert UIAppFonts -array "$app/Info.plist"
  for f in $( { ls "$vi" 2>/dev/null; ls "$rn/fonts" 2>/dev/null; } | grep -iE '\.(ttf|otf)$' | sort -u); do
    plutil -insert UIAppFonts.$i -string "$f" "$app/Info.plist"; i=$((i+1)); done
  echo "icon fonts: $i ($(ls "$rn/fonts" 2>/dev/null | wc -l | tr -d ' ') from the APK)"
fi
[ -d "$rn/app" ] && cp -R "$rn/app/." "$app/"
# the app's own identity instead of the template's "Host" (safe after the build: the IPA is unsigned)
[ -n "${5:-}" ] && plutil -replace CFBundleIdentifier -string "$5" "$app/Info.plist"
[ -n "${6:-}" ] && plutil -replace CFBundleDisplayName -string "$6" "$app/Info.plist"
# the APK's launcher icon as loose icon files (iOS still reads CFBundleIconFiles)
if [ -f "$rn/icon.png" ] && command -v sips > /dev/null; then
  sips -z 120 120 "$rn/icon.png" --out "$app/AppIcon60x60@2x.png" > /dev/null
  sips -z 180 180 "$rn/icon.png" --out "$app/AppIcon60x60@3x.png" > /dev/null
  plutil -remove CFBundleIcons "$app/Info.plist" 2>/dev/null || true
  plutil -insert CFBundleIcons -json '{"CFBundlePrimaryIcon":{"CFBundleIconFiles":["AppIcon60x60"],"CFBundleIconName":"AppIcon60x60"}}' "$app/Info.plist"
  echo "icon from the APK"
fi
echo "filled $app (${5:-template id}, ${6:-template name})"

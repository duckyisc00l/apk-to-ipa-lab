#!/bin/bash
# Make a LÖVE game ask iOS for its keyboard. Usage: ci/love/shim.sh in.love out.love
# A phone has no always-on keyboard: iOS only shows it after love.keyboard.setTextInput(true), and games written for
# a PC never call it. The shim renames the game's main.lua and adds a new main.lua that loads it, then wraps the
# touch/mouse callbacks: the first touch turns text input on if the game has love.textinput.
set -e
in="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"; out="$(cd "$(dirname "$2")" && pwd)/$(basename "$2")"
d=$(mktemp -d); (cd "$d" && unzip -q "$in")
root=$(dirname "$(find "$d" -maxdepth 3 -name main.lua | awk '{print length, $0}' | sort -n | head -1 | cut -d' ' -f2-)")
mv "$root/main.lua" "$root/main_game.lua"
cat > "$root/main.lua" <<'LUA'
-- iOS keyboard shim (added by the apk-to-ipa lab)
love.filesystem.load("main_game.lua")()
local function want()
  if love.textinput and love.keyboard and love.keyboard.hasTextInput and not love.keyboard.hasTextInput() then
    love.keyboard.setTextInput(true)
  end
end
for _, name in ipairs({ "touchpressed", "mousepressed" }) do
  local orig = love[name]
  love[name] = function(...) want(); if orig then return orig(...) end end
end
LUA
rm -f "$out"; (cd "$d" && zip -qr "$out" .)

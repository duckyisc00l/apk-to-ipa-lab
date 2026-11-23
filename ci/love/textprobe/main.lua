-- Tiny LÖVE game for testing typing on iPhone: shows what love.textinput / love.keypressed receive,
-- and prints each event (TI:<text> / KP:<key>) so the simulator log proves it. If a file "selfenable"
-- is in the game, it calls love.keyboard.setTextInput(true) on touch itself (like most text games do).
io.stdout:setvbuf("no")
local text, keys = "", ""
function love.load() love.graphics.setNewFont(40); selfEnable = love.filesystem.getInfo("selfenable") ~= nil end
function love.textinput(t) text = text .. t; print("TI:" .. t) end
function love.keypressed(k) keys = keys .. k .. " "; print("KP:" .. k)
  if k == "backspace" then text = text:sub(1, -2) end end
function love.touchpressed() if selfEnable then love.keyboard.setTextInput(true) end end
function love.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.printf("typed: " .. text, 10, 100, 380)
  love.graphics.printf("keys: " .. keys, 10, 400, 380)
  love.graphics.printf("selfenable: " .. tostring(selfEnable) .. "\ntextinput on: " .. tostring(love.keyboard.hasTextInput()), 10, 700, 380)
end

-- Moon Runner by Wee Wisp Games
-- http://weewispgames.tumblr.com/
-- main.lua

-- includes
Gamestate = require "lib/gamestate"
Camera = require "lib/humpCamera"
require "lib/maid64"
require "lib/anim8"
require "states/menu"

-- global functions
function copy(obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
  return res
end

-- global vars
--camPos = 144
--camPos = 730
camPos = 946

function love.load(arg)
  love.window.setMode(480, 432, {resizable=true, vsync=true, minwidth=160, minheight=144}) -- set the window mode

  math.randomseed(os.time()) -- seed love.math.rand() using os time
  love.graphics.setDefaultFilter("nearest", "nearest") -- set nearest pixel distance

  -- load fonts
  smallFont = love.graphics.newFont("lib/Early Gameboy.ttf", 7)
  medFont = love.graphics.newFont("lib/Early Gameboy.ttf", 10)
  bigFont = love.graphics.newFont("lib/Early Gameboy.ttf", 14)
  love.graphics.setFont(smallFont)

  Gamestate.registerEvents()
  Gamestate.switch(menu) -- swtich to game screen
end

function love.resize(w, h)
    -- this is used to resize the screen correctly
    maid64.resize(w, h)
    camera = Camera(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2 + player.y - 80)
    camera.smoother = Camera.smooth.upwardDamped(1)
end

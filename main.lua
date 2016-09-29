-- Moon Runner by Wee Wisp Games
-- main.lua

-- includes
Gamestate = require "lib/gamestate"
require "lib/maid64"
require 'states/menu'

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

function love.load(arg)
  love.window.setMode(800, 720, {resizable=true, vsync=true, minwidth=200, minheight=200}) -- set the window mode

  math.randomseed(os.time()) -- seed love.math.rand() using os time
  love.graphics.setDefaultFilter("nearest", "nearest") -- set nearest pixel distance

  Gamestate.registerEvents()
  Gamestate.switch(menu) -- swtich to game screen
end

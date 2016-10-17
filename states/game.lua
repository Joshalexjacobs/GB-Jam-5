-- game.lua
game = {} -- create game gamestate

require "states/win"

player = require "player"
anim8 = require 'lib/anim8' -- our animation library
local sti = require "lib/sti" -- simple tiled implementation
local bump = require "lib/bump" -- our collision library

require "pBullets"
require "eBullets"
require "upgrades"
require "enemies"
require "enemyDictionary"
require "lib/timer" -- a simple timer library
require "checkPoint"

-- game win condition
gameOver = false

-- game timers
local timers = {}

-- collision using bump
local world = bump.newWorld()

function game:enter()
  -- initialize map
  map = sti("img/tileMap.lua", {"bump"})
  map:bump_init(world)

  -- initalize collision objects
  for _, object in ipairs(map.objects) do
    if object.properties.collidable then
      world:add(object, object.x, object.y, object.width, object.height)
    end
  end

  -- initialize camera
  camera = Camera(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2 + player.y - 80)
  camera.smoother = Camera.smooth.upwardDamped(1)

  -- load bg music
  --space = love.audio.newSource("music/space.wav")

  -- update camPos once
  local left, top = camera:position()
  camPos = top - love.graphics.getHeight() / 2 -- 216 may change as the tilemap changes

  -- intialize player
  player:load(world)

  -- load player and enemy bullet assets
  loadPBullet()
  loadEBullet()

  -- load upgrades
  loadUpgrades()

  -- load each section of map with enemies/objects
  loadCheckPoint(world)

  -- load all crates (non respawnable)
  loadCrates(world)
end

function game:keypressed(key, code)
  if key == 'escape' then -- quit on escape
    love.event.quit()
  end

  if key == '1' then --- may take this out before release OR only leave it active in the main menu [TAKE OUT BEFORE RELEASE]
      maid64.nextPallet() --you can go to the next pallet in the list during the game
  elseif key == '2' then
      maid64.prevPallet() --you can go to the previous pallet in the list during the game
  end
end

function game:update(dt)
  if gameOver and checkTimer("win", timers) == false then
    addTimer(0.5, "win", timers)
  elseif updateTimer(dt, "win", timers) then
    Gamestate.switch(win)
  end


  if space:isPlaying() == false then
    love.audio.play(space)
  end

  player:update(dt, world) -- update player
  updatePBullets(dt, world) -- update player bullets

  updateCheckPoint(world) -- update the player's current checkpoint

  updateEnemy(dt, world) -- update enemies
  updateEBullets(dt, world) -- update enemy bullets

  updateUpgrade(dt, world)

  local left, top = camera:position()

  camPos = top - love.graphics.getHeight() / 2 -- 216 may change as the tilemap changes
  if player.isDead == false then
    if camPos > 0 then
      camera:lockY(player.y - 90 + love.graphics.getHeight() / 2) -- - 80 + love...
    end
  elseif camPos < player.checkPoint - 50 then
    camera:move(0, 2)
  else
    player:respawn(world)
  end
end

function game:draw()
  maid64.start() -- starts the maid64 process
  camera:attach()

  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, 160, 144)
  love.graphics.setColor(255, 255, 255, 255)

  map:draw()

  drawUpgrade()

  drawEnemy()
  drawEBullets()

  player:draw()
  drawPBullets()

  camera:detach()

  --- prints the current palette that is being displayed [TAKE OUT BEFORE RELEASE]
  --love.graphics.printf(tostring(maid64.getPaletteIndex()), 145, 0, 20)
  player:drawHealth()
  maid64.finish() -- finishes the maid64 process
  --love.graphics.rectangle("fill", 0, 0, 160, 1)
end

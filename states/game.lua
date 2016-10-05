-- game.lua
game = {} -- create game gamestate

player = require "player"
anim8 = require 'lib/anim8' -- our animation library
local sti = require "lib/sti" -- simple tiled implementation
local bump = require "lib/bump" -- our collision library


require "pBullets"
require "eBullets"
require "enemies"
require "enemyDictionary"
require "lib/timer" -- a simple timer library

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

  -- intialize player
  player:load(world)

  -- load player and enemy bullet assets
  loadPBullet()
  loadEBullet()

  --add a test enemy
  --addEnemy(65, 209, "doubleDoor", world)
  addEnemy(75, player.y - 40, "mine", world)
  addEnemy(75, 175, "moonBug", world)

  addEnemy(100, 150, "centipede", world)
  addEnemy(84, 145, "centipede", world)
  addEnemy(68, 140, "centipede", world)

  addEnemy(52, 100, "centipede", world)
  addEnemy(36, 95, "centipede", world)
  addEnemy(20, 90, "centipede", world)

  addEnemy(75, 0, "moonBug", world)
  addEnemy(100, 100, "moonCrab", world)
  addEnemy(25, 100, "moonCrab", world)
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
  player:update(dt, world) -- update player
  updatePBullets(dt, world) -- update player bullets

  updateEnemy(dt, world) -- update enemies
  updateEBullets(dt, world) -- update enemy bullets

  local left, top = camera:position()

  camPos = top - love.graphics.getHeight() / 2 -- 216 may change as the tilemap changes

  camera:lockY(player.y - 80 + love.graphics.getHeight() / 2)
end

function game:draw()
  maid64.start() -- starts the maid64 process
  camera:attach()

  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, 160, 144)
  love.graphics.setColor(255, 255, 255, 255)

  map:draw()

  drawEnemy()
  drawEBullets()

  player:draw()
  drawPBullets()

  camera:detach()

  --- prints the current palette that is being displayed [TAKE OUT BEFORE RELEASE]
  love.graphics.printf(tostring(maid64.getPaletteIndex()), 145, 0, 20)

  maid64.finish() -- finishes the maid64 process
  --love.graphics.rectangle("fill", 0, 0, 160, 1)
end

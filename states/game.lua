-- game.lua
game = {} -- create game gamestate

player = require "player"
sti = require "lib/sti"
local bump = require "lib/bump"

require "pBullets"
require "lib/timer"

-- collision using bump
local world = bump.newWorld()

-- camera's constant vertical movement
local camDY = 0
local camSpeed = -25

function game:enter()
  -- initialize map
  map = sti("img/tileMap.lua", {"bump"})
  map:bump_init(world)

  -- initialize camera
  camera = Camera(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2 + camPos)
  camera.smoother = Camera.smooth.damped(10)

  -- intialize player
  player:load(world)

  -- test crater
  crater = maid64.newImage("img/craterTest.png")
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

  --camDY = camSpeed * dt -- current deactivated

  local left, top = camera:position()
  camPos = camPos + camDY -- update camera position

  camera:move(0, camDY) -- move camera
end

function game:draw()
  maid64.start() -- starts the maid64 process
  camera:attach()

  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, 160, 144)
  love.graphics.setColor(255, 255, 255, 255)

  map:draw()

  love.graphics.draw(crater, 120, 150, 0, 1, 1, 0, 0)

  player:draw()
  drawPBullets()
  camera:detach()

  --- prints the current palette that is being displayed [TAKE OUT BEFORE RELEASE]
  love.graphics.printf(tostring(maid64.getPaletteIndex()), 145, 0, 20)

  maid64.finish() -- finishes the maid64 process
end

-- game.lua
game = {} -- create game gamestate

player = require "player"

function game:enter()
  -- load stuff
end

function game:keypressed(key, code)
  if key == 'escape' then -- quit on escape
    love.event.quit()
  end
end

function game:update(dt)
  player:update(dt)
end

function game:draw()
  maid64.start() -- starts the maid64 process

  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, 160, 144)

  love.graphics.setColor(255, 255, 255, 255)
  player:draw()

  maid64.finish() -- finishes the maid64 process
end

-- game.lua
game = {} --

function game:enter()
  -- load stuff
end

function game:keypressed(key, code)
  if key =='escape' then -- quit on escape
    love.event.quit()
  end
end

function game:update(dt)
  -- update
end

function game:draw()
  -- draw to screen
end

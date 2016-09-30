-- player.lua

local player = {
  x = 50,
  y = 50,
  w = 10,
  h = 10,
  dx = 0,
  dy = 0,
  speed = 50,
  decel = 8,
}

function player:load()
  -- load img...
end

function player:update(dt)
  -- 8 way movement
  if love.keyboard.isDown('w') and love.keyboard.isDown('s') == false then
    player.dy = -(dt * player.speed)
  elseif love.keyboard.isDown('s') and love.keyboard.isDown('w') == false then
    player.dy = (dt * player.speed)
  end

  if love.keyboard.isDown('a') and love.keyboard.isDown('d') == false then
    player.dx = -(dt * player.speed)
  elseif love.keyboard.isDown('d') and love.keyboard.isDown('a') == false then
    player.dx = (dt * player.speed)
  end

  -- update player coordinates
  player.x = player.x + player.dx
  player.y = player.y + player.dy

  -- deceleration
  if love.keyboard.isDown("d") == false and player.dx > 0 then -- moving right
    player.dx = math.max((player.dx - player.decel * dt), 0)
  elseif love.keyboard.isDown("a") == false and player.dx < 0 then -- moving left
    player.dx = math.min((player.dx + player.decel * dt), 0)
  end

  if love.keyboard.isDown("s") == false and player.dy > 0 then -- moving down
    player.dy = math.max((player.dy - player.decel * dt), 0)
  elseif love.keyboard.isDown("w") == false and player.dy < 0 then -- moving up
    player.dy = math.min((player.dy + player.decel * dt), 0)
  end
end

function player:draw()
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end


return player

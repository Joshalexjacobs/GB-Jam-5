-- player.lua

local player = {
  hp = 1,
  type = "player",
  x = 75,
  y = 250,
  w = 10,
  h = 10,
  dx = 0,
  dy = 0,
  speed = 60,
  decel = 8,
  shootRate = 0.25,
  bulletLife = 0.25, -- how long each bullet is alive in seconds
  filter = function(item, other)
    -- nothing yet
  end,
  timers = {},
}

function player:load(world)
  world:add(player, player.x, player.y, player.w, player.h)
end

function player:shoot(angle, world)
  if checkTimer("shoot", player.timers) == false then
    addPBullet(player.x + player.w / 2, player.y, angle, player.bulletLife, world)
    addTimer(player.shootRate, "shoot", player.timers)
  end
end

function player:update(dt, world)
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

  local cols, len = 0, 0

  -- update player coordinates
  player.x, player.y, cols, len = world:move(player, player.x + player.dx, player.y + player.dy, player.filter)

  -- and check for collision
  -- stuff... here...

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

  if love.keyboard.isDown("m") and love.keyboard.isDown("n") then
    player:shoot(-math.pi/2, world)
  elseif love.keyboard.isDown("m") then
    player:shoot(7*math.pi/4, world)
  elseif love.keyboard.isDown("n") then
    player:shoot(5*math.pi/4, world)
  end

  if updateTimer(dt, "shoot", player.timers) then
    deleteTimer("shoot", player.timers)
  end

end

function player:draw()
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end


return player

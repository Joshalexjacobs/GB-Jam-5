-- pBullets.lua --- player bullets

local pBullet = {
  x = 0,
  y = 0,
  w = 2,
  h = 2,
  dir = 0,
  speed = 125,
  lifeTime = 0, -- determines how long the bullet is alive for
  filter = function(item, other)
    -- nothing yet
  end,
  timers = {}
}

pBullets = {}

function addPBullet(pX, pY, pDir, life, world)
  local newPBullet = copy(pBullet, newPBullet)
  newPBullet.x, newPBullet.y, newPBullet.dir, newPBullet.lifeTime = pX, pY, pDir, life

  world:add(newPBullet, newPBullet.x, newPBullet.y, newPBullet.w, newPBullet.h) -- add all bullets to world

  addTimer(newPBullet.lifeTime, "life", newPBullet.timers)-- start lifeTime timer

  table.insert(pBullets, newPBullet)
end

function removePBullet(entity, i, world)
  table.remove(pBullets, i)
  world:remove(entity)
end

function updatePBullets(dt, world)
  for i, newPBullet in ipairs(pBullets) do
    newPBullet.dx = math.cos(newPBullet.dir) * newPBullet.speed * dt
    newPBullet.dy = math.sin(newPBullet.dir) * newPBullet.speed * dt

    local cols, len = 0, 0

    -- move bullets
    newPBullet.x, newPBullet.y, cols, len = world:move(newPBullet, newPBullet.x + newPBullet.dx, newPBullet.y + newPBullet.dy, newPBullet.filter)

    -- handle collision
    -- collision stuff...

    if updateTimer(dt, "life", newPBullet.timers) then
      removePBullet(newPBullet, i, world)
    end
  end
end

function drawPBullets()
  for _, newPBullet in ipairs(pBullets) do
    love.graphics.rectangle("fill", newPBullet.x, newPBullet.y, newPBullet.w, newPBullet.h)
  end
end

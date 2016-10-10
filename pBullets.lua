-- pBullets.lua --- player bullets

local pBullet = {
  type = "pBullet",
  x = 0,
  y = 0,
  w = 2,
  h = 2,
  dir = 0,
  speed = 200,
  lifeTime = 0, -- determines how long the bullet is alive for
  isDead = false,
  filter = function(item, other)
    if other.type == "enemy" or other.type == "block" then
      return 'touch'
    end
  end,
  timers = {}
}

pBullets = {}

function loadPBullet()
  hit = love.audio.newSource("sfx/hit.wav", "static")
  hit:setVolume(0.1)
end

function addPBullet(pX, pY, pDir, life, world)
  local newPBullet = copy(pBullet, newPBullet)
  newPBullet.x, newPBullet.y, newPBullet.dir, newPBullet.lifeTime = pX, pY, pDir, life

  world:add(newPBullet, newPBullet.x, newPBullet.y, newPBullet.w, newPBullet.h) -- add all bullets to world

  addTimer(newPBullet.lifeTime, "life", newPBullet.timers)-- start lifeTime timer

  table.insert(pBullets, newPBullet)
end

function removePBullet(entity, i, world)
  world:remove(entity)
  table.remove(pBullets, i)
end

function updatePBullets(dt, world)
  for i, newPBullet in ipairs(pBullets) do
    newPBullet.dx = math.cos(newPBullet.dir) * newPBullet.speed * dt
    newPBullet.dy = math.sin(newPBullet.dir) * newPBullet.speed * dt

    local cols, len = 0, 0

    -- move bullets
    if newPBullet.isDead == false then
      newPBullet.x, newPBullet.y, cols, len = world:move(newPBullet, newPBullet.x + newPBullet.dx, newPBullet.y + newPBullet.dy, newPBullet.filter)
    end

    -- handle collision
    for j = 1, len do
      if cols[j].other.type == "enemy" then
        cols[j].other.hp = cols[j].other.hp - 1
        cols[j].other.isHit = true
        hit:setPitch(love.math.random(8, 12) * 0.1)
        hit:play()
        removePBullet(newPBullet, i, world)
      elseif cols[j].other.type == "block" then
        removePBullet(newPBullet, i, world)
      end
    end

    if updateTimer(dt, "life", newPBullet.timers) or newPBullet.isDead == true then
      newPBullet.isDead = true
      if world:hasItem(newPBullet) then removePBullet(newPBullet, i, world) end
    end
  end
end

function drawPBullets()
  for _, newPBullet in ipairs(pBullets) do
    love.graphics.rectangle("fill", newPBullet.x, newPBullet.y, newPBullet.w, newPBullet.h)
  end
end

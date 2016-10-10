-- eBullets.lua --- enemy bullets

local eBullet = {
  type = "eBullet",
  x = 0,
  y = 0,
  w = 2,
  h = 2,
  dir = 0,
  speed = 100,
  lifeTime = 0, -- determines how long the bullet is alive for
  isDead = false,
  filter = function(item, other)
    if other.type == "player" or other.type == "block" then
      return 'touch'
    end
  end,
  timers = {}
}

eBullets = {}

function loadEBullet()
  hit = love.audio.newSource("sfx/hit.wav", "static")
  eShoot = love.audio.newSource("sfx/pShoot.wav", "static")

  eShoot:setPitch(0.80)
  eShoot:setVolume(0.1)
  hit:setVolume(0.1)
end

function addEBullet(pX, pY, pDir, life, world)
  local newEBullet = copy(eBullet, newEBullet)
  newEBullet.x, newEBullet.y, newEBullet.dir, newEBullet.lifeTime = pX, pY, pDir, life

  world:add(newEBullet, newEBullet.x, newEBullet.y, newEBullet.w, newEBullet.h) -- add all bullets to world

  addTimer(newEBullet.lifeTime, "life", newEBullet.timers)-- start lifeTime timer

  table.insert(eBullets, newEBullet)

  eShoot:play()
end

function removeEBullet(entity, i, world)
  world:remove(entity)
  table.remove(eBullets, i)
end

function updateEBullets(dt, world)
  for i, newEBullet in ipairs(eBullets) do
    newEBullet.dx = math.cos(newEBullet.dir) * newEBullet.speed * dt
    newEBullet.dy = math.sin(newEBullet.dir) * newEBullet.speed * dt

    local cols, len = 0, 0

    -- move bullets
    if newEBullet.isDead == false then
      newEBullet.x, newEBullet.y, cols, len = world:move(newEBullet, newEBullet.x + newEBullet.dx, newEBullet.y + newEBullet.dy, newEBullet.filter)
    end

    -- handle collision
    for j = 1, len do
      if cols[j].other.type == "player" then
        cols[j].other:kill()
        hit:setPitch(love.math.random(8, 12) * 0.1)
        hit:play()
        removeEBullet(newEBullet, i, world)
      elseif cols[j].other.type == "block" then
        removeEBullet(newEBullet, i, world)
      end
    end

    if updateTimer(dt, "life", newEBullet.timers) or newEBullet.isDead == true then
      newEBullet.isDead = true
      if world:hasItem(newEBullet) then removeEBullet(newEBullet, i, world) end
    end
  end
end

function drawEBullets()
  for _, newEBullet in ipairs(eBullets) do
    love.graphics.rectangle("fill", newEBullet.x, newEBullet.y, newEBullet.w, newEBullet.h)
  end
end

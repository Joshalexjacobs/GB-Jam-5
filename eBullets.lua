-- eBullets.lua --- enemy bullets

local eBullet = {
  type = "eBullet",
  x = 0,
  y = 0,
  offX = 2,
  offY = 2,
  w = 2,
  h = 2,
  dir = 0,
  speed = 100,
  lifeTime = 0, -- determines how long the bullet is alive for
  isDead = false,
  playDead = false, -- tells when death anim is over
  filter = function(item, other)
    if other.type == "player" or other.type == "block" then
      return 'touch'
    end
  end,
  timers = {},
  animations = nil,
  spriteSheet = nil,
  spriteGrid = nil,
  curAnim = 1,
}

eBullets = {}

function loadEBullet()
  -- load images
  eBullet.spriteSheet = maid64.newImage("img/bulletHit.png")
  eBullet.spriteGrid = anim8.newGrid(6, 6, 18, 12, 0, 0, 0)
  eBullet.animations = {
    anim8.newAnimation(eBullet.spriteGrid(1, 1), 0.1), -- 1 idle
    anim8.newAnimation(eBullet.spriteGrid("1-3", 1, 1, 2), 0.05, "pauseAtEnd"), -- 2 exploding
  }

  -- load sfx
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
        newEBullet.isDead = true
        --removeEBullet(newEBullet, i, world)
      elseif cols[j].other.type == "block" then
        newEBullet.isDead = true
        --removeEBullet(newEBullet, i, world)
      end
    end

    if updateTimer(dt, "life", newEBullet.timers) then
      newEBullet.isDead = true
      if world:hasItem(newEBullet) then removeEBullet(newEBullet, i, world) end
    end

    if newEBullet.isDead == true then
      if checkTimer("life", newEBullet.timers) then
        deleteTimer("life", newEBullet.timers)
      end
      newEBullet.curAnim = 2
      newEBullet.type = "dead"
      newEBullet.dx, newEBullet.dy = 0, 0
      newEBullet.animations[newEBullet.curAnim]:update(dt)

      if checkTimer("dead", newEBullet.timers) == false then
        addTimer(0.4, "dead", newEBullet.timers)
      end

      if updateTimer(dt, "dead", newEBullet.timers) then
        newEBullet.playDead = true
      end
    end

    if newEBullet.playDead == true then
      if world:hasItem(newEBullet) then removePBullet(newEBullet, i, world) end
    end

  end
end

function drawEBullets()
  for _, newEBullet in ipairs(eBullets) do
    --love.graphics.rectangle("fill", newEBullet.x, newEBullet.y, newEBullet.w, newEBullet.h)
    newEBullet.animations[newEBullet.curAnim]:draw(newEBullet.spriteSheet, newEBullet.x, newEBullet.y, 0, 1, 1, newEBullet.offX, newEBullet.offY)
  end
end

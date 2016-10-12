-- pBullets.lua --- player bullets

local pBullet = {
  type = "pBullet",
  x = 0,
  y = 0,
  offX = 2,
  offY = 2,
  w = 2,
  h = 2,
  dir = 0,
  speed = 200,
  lifeTime = 0, -- determines how long the bullet is alive for
  isDead = false,
  playDead = false, -- play death animation
  filter = function(item, other)
    if other.type == "enemy" or other.type == "block" or other.type == "crate" then
      return 'touch'
    end
  end,
  timers = {},
  animations = nil,
  spriteSheet = nil,
  spriteGrid = nil,
  curAnim = 1,
}

pBullets = {}

function loadPBullet()
  -- load images
  pBullet.spriteSheet = maid64.newImage("img/bulletHit.png")
  pBullet.spriteGrid = anim8.newGrid(6, 6, 18, 12, 0, 0, 0)
  pBullet.animations = {
    anim8.newAnimation(pBullet.spriteGrid(2, 2, 1, 1), {0.05, 0.1}, "pauseAtEnd"), -- 1 idle
    anim8.newAnimation(pBullet.spriteGrid("1-3", 1, 1, 2), 0.05, "pauseAtEnd"), -- 2 exploding
  }

  -- load sfx
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
    if newPBullet.isDead == false then
      newPBullet.dx = math.cos(newPBullet.dir) * newPBullet.speed * dt
      newPBullet.dy = math.sin(newPBullet.dir) * newPBullet.speed * dt
    end

    local cols, len = 0, 0

    -- move bullets
    if newPBullet.isDead == false then
      newPBullet.x, newPBullet.y, cols, len = world:move(newPBullet, newPBullet.x + newPBullet.dx, newPBullet.y + newPBullet.dy, newPBullet.filter)
    end

    -- handle collision
    for j = 1, len do
      if cols[j].other.type == "enemy" or cols[j].other.type == "crate"  then
        cols[j].other.hp = cols[j].other.hp - 1
        cols[j].other.isHit = true
        hit:setPitch(love.math.random(8, 12) * 0.1)
        hit:play()
        newPBullet.isDead = true
      elseif cols[j].other.type == "block" then
        newPBullet.isDead = true
      end
    end

    if updateTimer(dt, "life", newPBullet.timers) then
      newPBullet.isDead = true
      if world:hasItem(newPBullet) then removePBullet(newPBullet, i, world) end
    end

    if newPBullet.isDead == true then
      if checkTimer("life", newPBullet.timers) then
        deleteTimer("life", newPBullet.timers)
      end
      newPBullet.curAnim = 2
      newPBullet.type = "dead"
      newPBullet.dx, newPBullet.dy = 0, 0

      if checkTimer("dead", newPBullet.timers) == false then
        addTimer(0.4, "dead", newPBullet.timers)
      end

      if updateTimer(dt, "dead", newPBullet.timers) then
        newPBullet.playDead = true
      end
    end

    if newPBullet.playDead == true then
      if world:hasItem(newPBullet) then removePBullet(newPBullet, i, world) end
    end

    newPBullet.animations[newPBullet.curAnim]:update(dt)

  end
end

function drawPBullets()
  for _, newPBullet in ipairs(pBullets) do
    newPBullet.animations[newPBullet.curAnim]:draw(newPBullet.spriteSheet, newPBullet.x, newPBullet.y, 0, 1, 1, newPBullet.offX, newPBullet.offY)
  end
end

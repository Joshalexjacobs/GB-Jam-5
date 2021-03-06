-- player.lua

local player = {
  hp = 3,
  type = "player",
  checkPoint = 2680, -- starts at 2680
  x = 75,
  y = 2680, -- 2680 == checkpoint 1 -- 1930 == 2 -- 900 == checkpoint 3
  w = 10,
  h = 10,
  dx = 0,
  dy = 0,
  speed = 40,
  decel = 8,
  shootRate = 0.16,
  bulletLife = 0.225, -- how long each bullet is alive in seconds
  isDead = false,
  isHit = false,
  curAnim = 1,
  spriteSheet = nil,
  spriteGrid = nil,
  animations = nil,
  filter = function(item, other)
    if other.type == "block" or other.name == "doubleDoor" or other.type == "crate" then
      return 'slide'
    elseif other.type == "mine" or other.type == "upgrade" then
      return 'cross'
    end
  end,
  timers = {},
  noUpgrades = true,
  doubleShot = false,
  spread = false,
  machineGun = false,
}

function player:load(world)
  player.spriteSheet = maid64.newImage("img/player.png")
  player.spriteGrid = anim8.newGrid(16, 18, 48, 36, 0, 0, 0)

  player.animations = {
    anim8.newAnimation(player.spriteGrid("1-2", 1), 0.5), -- 1 idle
    anim8.newAnimation(player.spriteGrid("1-3", 2, 2, 2), 0.1), -- 2 walk
  }

  world:add(player, player.x, player.y, player.w, player.h)

  -- player shoot sfx
  pShoot = love.audio.newSource("sfx/other.wav", "static") -- new shooting sfx
  pShoot:setVolume(0.1)

  -- player hit sfx
  pHit = love.audio.newSource("sfx/pHit.wav", "static")
  pHit:setVolume(0.1)
end

function player:shoot(angle, world)
  if checkTimer("shoot", player.timers) == false then
    if player.noUpgrades then
      addPBullet(player.x + player.w / 2 - 1, player.y, angle, player.bulletLife, world)
      addTimer(player.shootRate, "shoot", player.timers)
      pShoot:setPitch(love.math.random(9, 12) * 0.1)
      pShoot:play()
    elseif player.doubleShot then
      addPBullet(player.x + player.w / 2 + 3, player.y, angle, player.bulletLife, world)
      addPBullet(player.x + player.w / 2 - 3, player.y, angle, player.bulletLife, world)
      addTimer(player.shootRate, "shoot", player.timers)
      pShoot:setPitch(love.math.random(6, 8) * 0.1) -- doubleShot should have a different sfx
      pShoot:play()
    elseif player.spread then
      addPBullet(player.x + player.w / 2 - 1, player.y, angle, player.bulletLife, world)
      addPBullet(player.x + player.w / 2 - 1, player.y, angle + 0.2, player.bulletLife, world)
      addPBullet(player.x + player.w / 2 - 1, player.y, angle - 0.2, player.bulletLife, world)
      addTimer(player.shootRate, "shoot", player.timers)
      pShoot:setPitch(love.math.random(14, 16) * 0.1) -- doubleShot should have a different sfx
      pShoot:play()
    end
  end
end

function player:kill()
  if checkTimer("invincible", player.timers) == false then
    player.hp = player.hp - 1
    player.dy = 2.5

    pHit:setPitch(love.math.random(8, 12) * 0.1)
    pHit:play()

    addTimer(1.0, "invincible", player.timers)
    addTimer(0.4, "hit", player.timers)
    player.isHit = true
    if player.hp <= 0 then
      player.isDead = true
      player.type = "dead"
    end
  end
end

function player:respawn(world)
  removeAllUpgrades(world)
  removeAllEnemies(world)
  player.hp = 3
  player.isDead = false
  player.type = "player"

  -- reset upgrades
  player.noUpgrades = true
  player.doubleShot = false
  player.spread = false
  player.machineGun = false

  player.x = 75
  player.y = player.checkPoint
  world:move(player, player.x, player.y)
  loadCheckPoint(world)
  loadCrates(world)
end

function player:update(dt, world)
  if player.isDead == false then

    if player.dx == 0 and player.dy == 0 then
      player.curAnim = 1
    else
      player.curAnim = 2
    end

    -- update anim
    player.animations[player.curAnim]:update(dt)

    -- if player was hit, add and update timer
    if player.isHit then
      if checkTimer("isHit", player.timers) == false then
        addTimer(0.05, "isHit", player.timers)
      elseif updateTimer(dt, "isHit", player.timers) then
        player.isHit = false
        deleteTimer("isHit", player.timers)
      end
    end

    if player.isHit == false and checkTimer("hit", player.timers) == false then
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
    end

    local cols, len = 0, 0

    -- update player coordinates
    player.x, player.y, cols, len = world:move(player, player.x + player.dx, player.y + player.dy, player.filter)

    -- and check for collision
    for j = 1, len do
      if cols[j].other.type == "mine" then
        cols[j].other.curAnim = 2
        cols[j].other.type = "timebomb"
      end
    end

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

    -- shooting with M/N
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

    if updateTimer(dt, "invincible", player.timers) then
      deleteTimer("invincible", player.timers)
    end

    if updateTimer(dt, "hit", player.timers) then
      deleteTimer("hit", player.timers)
    end
  end
end

function player:draw()
  if player.isDead == false then
    if player.isHit then -- if the enemy was hit, make them flash for a tick
      love.graphics.setColor(150, 150, 150, 255)
    end

    --love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
    player.animations[player.curAnim]:draw(player.spriteSheet, player.x, player.y, 0, 1, 1, 3, 3)
  end
end

function player:drawHealth()
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 6, 3, 26, 8) -- first background for hp bar
  love.graphics.rectangle("fill", 6, 0, 8, 4) -- print a background to the text "HP"
  love.graphics.setColor(255, 255, 255, 255)
  -- in order to print the letters "HP" to the screen without including a new font that's legible
  -- at a very small size, i'm drawing the pixels for each letter individual letter.
  -- not the cleanest method, but it's better than nothing

  local p = 7 -- p was created to adjust the x position of HP easily
  love.graphics.points(p, 1, p, 2, p, 3, p+1, 2, p+2, 1, p+2, 2, p+2, 3) -- H
  love.graphics.points(p+4, 1, p+4, 2, p+4, 3, p+5, 1, p+5, 2) -- P

  love.graphics.rectangle("fill", 7, 4, 24, 6) -- print a second background to the health bar
  love.graphics.setColor(150, 150, 150, 255)

  for i = 1, player.hp do -- print a health bar for each hit point the player has
    love.graphics.rectangle("fill", 6 * i + i * 2, 5, 6, 4)
  end

  love.graphics.setColor(255, 255, 255, 255) -- reset color
end

return player

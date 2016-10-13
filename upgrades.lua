-- upgrades.lua

local upgrade = {
  name = "",
  type = "upgrade",
  x = 0,
  y = 0,
  w = 8,
  h = 8,
  dx = 0,
  dy = 0,
  isDead = false,
  playDead = false,
  spriteSheet = nil,
  spriteGrid = nil,
  animations = nil,
  curAnim = 1, -- determines which upgrade will be drawn
  timers = {},
  filter = function(item, other)
    if other.type == "player" then
      return 'cross'
    end
  end,
  collision = function(cols, len)
    for j = 1, len do
      if cols[j].other.type == "player" then
        -- nothing
      end
    end
  end
}

local upgrades = {}

function loadUpgrades()
  -- load images
  upgrade.spriteSheet = maid64.newImage("img/upgrades.png")
  upgrade.spriteGrid = anim8.newGrid(8, 8, 24, 8, 0, 0, 0)
  upgrade.animations = {
    anim8.newAnimation(upgrade.spriteGrid(1, 1), 0.1, "pauseAtEnd"), -- 1 refillHP
    anim8.newAnimation(upgrade.spriteGrid(2, 1), 0.1, "pauseAtEnd"), -- 2 bulletLife
    anim8.newAnimation(upgrade.spriteGrid(3, 1), 0.1, "pauseAtEnd"), -- 3 bulletSpeed
  }

  -- load sfx
  upgradeSFX = love.audio.newSource("sfx/upgrade.wav", "static")
  upgradeSFX:setVolume(0.05)
end

function addUpgrade(nX, nY, world, n)
  n = n or "random" -- if n is left empty then the upgrade is random

  -- copy upgrade
  local newUpgrade = copy(upgrade, newUpgrade)
  newUpgrade.x, newUpgrade.y, newUpgrade.name = nX, nY, n

  -- get upgrade's collision function
  getUpgradeCol(newUpgrade)

  -- add to world and upgrades table
  world:add(newUpgrade, newUpgrade.x, newUpgrade.y, newUpgrade.w, newUpgrade.h)
  table.insert(upgrades, newUpgrade)
end

function removeUpgrade(entity, i, world)
  world:remove(entity)
  table.remove(upgrades, i)
end

function updateUpgrade(dt, world)
  for i, newUpgrade in ipairs(upgrades) do
    -- float upgrade in place
    newUpgrade.dy = 0.075 * math.sin(love.timer.getTime() * 0.35 * math.pi)

    -- update upgrade coordinates
    newUpgrade.x, newUpgrade.y, cols, len = world:move(newUpgrade, newUpgrade.x + newUpgrade.dx, newUpgrade.y + newUpgrade.dy, newUpgrade.filter)

    -- handle collision
    newUpgrade.collision(cols, len, newUpgrade)

    if newUpgrade.isDead and checkTimer("dead", newUpgrade.timers) == false then
      addTimer(1.5, "dead", newUpgrade.timers)
      upgradeSFX:play()
    elseif updateTimer(dt, "dead", newUpgrade.timers) then
      removeUpgrade(newUpgrade, i, world)
    end

  end
end

function drawUpgrade()
  for _, newUpgrade in ipairs(upgrades) do
    if newUpgrade.isDead == false then
      newUpgrade.animations[newUpgrade.curAnim]:draw(newUpgrade.spriteSheet, newUpgrade.x, newUpgrade.y, 0, 1, 1, 0, 0)
    else
      love.graphics.printf(newUpgrade.name, -20, newUpgrade.y, 200, "center")
    end
  end
end

function getUpgradeCol(upg)
  -- REFILL HP
  if(upg.name == "REFILL HP") then
    upg.curAnim = 1
    upg.collision = function(cols, len, entity)
      for j = 1, len do
        if cols[j].other.type == "player" and entity.isDead == false then
          cols[j].other.hp = 3
          entity.isDead = true
        end
      end
    end

  -- BULLET LIFE
elseif(upg.name == "SHOOT DIST.") then
    upg.curAnim = 2
    upg.collision = function(cols, len, entity)
      for j = 1, len do
        if cols[j].other.type == "player" and entity.isDead == false then
          cols[j].other.bulletLife = cols[j].other.bulletLife + 0.025
          entity.isDead = true
        end
      end
    end

    -- BULLET SPEED
  elseif(upg.name == "FIRE RATE") then
      upg.curAnim = 3
      upg.collision = function(cols, len, entity)
        for j = 1, len do
          if cols[j].other.type == "player" and entity.isDead == false then
            cols[j].other.shootRate = cols[j].other.shootRate - 0.01
            entity.isDead = true
          end
        end
      end

  end -- end of if/else

end


---- UPGRADES: ----
-- TEMPORARY
-- double shot, shoots left and right simultaneously or 2 bullets down the middle
-- spread, shoots 3 bullets in each direction instead of just 1
-- machine gun, shoots 3 bullets in a burst
-- shield, 1 free shot doesnt damage player hp (displays a lil shield around char, maybe a bubble?)

-- enemies.lua

local enemy = {
  type = "enemy",
  name = nil,
  hp = 1,
  x = 0,
  y = 0,
  offX = 0,
  offY = 0,
  w = 10,
  h = 10,
  dx = 0,
  dy = 0,
  dir = 0,
  speed = 50,
  timers = {},
  isHit = false,
  isDead = false,
  isActive = false,
  behaviour = nil,
  spriteSheet = nil,
  spriteGrid = nil,
  animations = nil,
  curAnim = 1,
  filter = function(item, other)
    if other.type == "player" then
      return 'slide'
    end
  end,
}

enemies = {}

function addEnemy(eX, eY, n, world)
  local newEnemy = copy(enemy, newEnemy)
  newEnemy.x, newEnemy.y, newEnemy.name = eX, eY, n

  -- load enemy specified
  getEnemy(newEnemy)

  world:add(newEnemy, newEnemy.x, newEnemy.y, newEnemy.w, newEnemy.h) -- add new enemy to the world

  table.insert(enemies, newEnemy)
end

function removeEnemy(entity, i, world)
  world:remove(entity)
  table.remove(enemies, i)
end

function updateEnemy(dt, world)
  for i, newEnemy in ipairs(enemies) do
    local cols, len = 0, 0

    -- pre update active check
    if newEnemy.isActive == false and camPos < newEnemy.y + newEnemy.h then
        newEnemy.isActive = true -- once the enemy is on screen, activate behaviour function
    elseif newEnemy.isActive then
      -- call enemy update function
      newEnemy.behaviour(dt, newEnemy)
    end

    -- update anim
    newEnemy.animations[newEnemy.curAnim]:update(dt)

    -- move enemies
    if newEnemy.isDead == false then
      newEnemy.x, newEnemy.y, cols, len = world:move(newEnemy, newEnemy.x + newEnemy.dx, newEnemy.y + newEnemy.dy, newEnemy.filter)
    end

    -- handle collision
    for j = 1, len do
      if cols[j].other.type == "player" then
        cols[j].other:kill()
      end
    end

    if newEnemy.hp <= 0 or newEnemy.isDead then
      newEnemy.isDead = true
      if world:hasItem(newEnemy) then removeEnemy(newEnemy, i, world) end
    end
  end
end

function drawEnemy()
  for _, newEnemy in ipairs(enemies) do
    if newEnemy.isHit then -- if the enemy was hit, make them flash for a tick
      love.graphics.setColor(0, 0, 0, 255)
      newEnemy.isHit = false
    end

    --love.graphics.rectangle("fill", newEnemy.x, newEnemy.y, newEnemy.w, newEnemy.h)
    newEnemy.animations[newEnemy.curAnim]:draw(newEnemy.spriteSheet, newEnemy.x, newEnemy.y, 0, 1, 1, newEnemy.offX, newEnemy.offY)
    love.graphics.setColor(255, 255, 255, 255)
  end
end

-- enemies.lua

local enemy = {
  hp = 1,
  type = "enemy",
  x = 0,
  y = 0,
  w = 10,
  h = 10,
  dx = 0,
  dy = 0,
  dir = 0,
  speed = 50,
  filter = function(item, other)
    -- nothing yet
  end,
  timers = {}
}

enemies = {}

function addEnemy(eX, eY, world)
  local newEnemy = copy(enemy, newEnemy)
  newEnemy.x, newEnemy.y = eX, eY

  world:add(newEnemy, newEnemy.x, newEnemy.y, newEnemy.w, newEnemy.h) -- add new enemy to the world

  table.insert(enemies, newEnemy)
end

function removeEnemy(entity, i, world)
  table.remove(enemies, i)
  world:remove(entity)
end

function updateEnemy(dt, world)
  for i, newEnemy in ipairs(enemies) do
    local cols, len = 0, 0

    -- move enemies
    newEnemy.x, newEnemy.y, cols, len = world:move(newEnemy, newEnemy.x + newEnemy.dx, newEnemy.y + newEnemy.dy, newEnemy.filter)

    if newEnemy.hp <= 0 then
      removeEnemy(newEnemy, i, world)
    end
  end
end

function drawEnemy()
  for _, newEnemy in ipairs(enemies) do
    love.graphics.printf(newEnemy.hp, newEnemy.x, newEnemy.y, 100)
    love.graphics.rectangle("fill", newEnemy.x, newEnemy.y, newEnemy.w, newEnemy.h)
  end
end

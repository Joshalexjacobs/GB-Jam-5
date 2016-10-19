-- moonbug.lua -- an enemy

local moonBug = {
  hp = 7,
  w = 14,
  h = 14,
  offX = 1,
  offY = 1,
  name = "moonBug",
  speed = 20,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      local angle = math.atan2(entity.y - player.y, entity.x - player.x)
      entity.dx = -math.cos(angle) * dt * entity.speed
      entity.dy = -math.sin(angle) * dt * entity.speed

      if entity.hp <= 0 then
        entity.isDead = true
      end

    elseif entity.isDead  and checkTimer("dead", entity.timers) == false then
      addTimer(0.6, "dead", entity.timers)
      entity.explode:setPitch(love.math.random(7, 14) * 0.1)
      entity.explode:play()
      entity.curAnim = 2
      entity.type = "dead"
      entity.dx = 0
      entity.dy = 0
      entity.filter = function(item, other)
      end
    end

    if updateTimer(dt, "dead", entity.timers) then
      entity.playDead = true
    end
  end,
  spriteSheet = "img/moonBug.png",
  spriteGrid = {x = 16, y = 16, w = 48, h = 64},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid("1-3", 1, 2, 1), 0.15), -- 1 running
      anim8.newAnimation(grid("1-3", "2-3", 1, 4), 0.1), -- 2 dying
    }
    return animations
  end,
}

return moonBug

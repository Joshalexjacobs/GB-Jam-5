-- centipede.lua -- an enemy

local centipede = {
  hp = 6,
  w = 14,
  h = 14,
  offX = 1,
  offY = 1,
  name = "centipede",
  speed = 10,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      entity.dy = 0.15 * math.sin(love.timer.getTime() * 0.5 * math.pi)

      if checkTimer("left", entity.timers) == false then
        entity.dx = entity.speed * dt
      else
        entity.dx = -entity.speed * dt
      end


      if entity.x + entity.w >= 160 and checkTimer("left", entity.timers) == false then
        addTimer(0.0, "left", entity.timers)
      end

      if entity.x <= 0 and checkTimer("left", entity.timers) then
        deleteTimer("left", entity.timers)
      end

      if entity.hp <= 0 then
        entity.isDead = true
      end

    elseif entity.isDead and checkTimer("dead", entity.timers) == false then
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
  spriteSheet = "img/centipede.png",
  spriteGrid = {x = 16, y = 16, w = 48, h = 64},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid("1-3", 1, 1, 2, "3-2", 1), {love.math.random(5, 20) * 0.1, 0.1, 0.1, 0.1, 0.1, 0.1}), -- 1 running
      anim8.newAnimation(grid("1-3", "3-4", 2, 2), 0.1, "pauseAtEnd"), -- 2 dying
    }
    return animations
  end,
}

return centipede

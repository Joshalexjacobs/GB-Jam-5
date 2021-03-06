-- moonTurret.lua -- an enemy

local moonTurret = {
  hp = 10,
  w = 14,
  h = 14,
  offX = 1,
  offY = 1,
  name = "moonTurret",
  speed = 0,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      if checkTimer("shoot", entity.timers) == false and checkTimer("reset", entity.timers) == false then
        addTimer(1.5, "shoot", entity.timers)
      end

      if checkTimer("shoot", entity.timers) and updateTimer(dt, "shoot", entity.timers) and checkTimer("reset", entity.timers) == false then
        entity.curAnim = 2
        addEBullet(entity.x + 6, entity.y + 10, math.pi / 2, 1.0, world)
        deleteTimer("shoot", entity.timers)
        addTimer(0.15, "reset", entity.timers)
      end

      if updateTimer(dt, "reset", entity.timers) then
        entity.curAnim = 1
        deleteTimer("reset", entity.timers)
      end

      if entity.hp <= 0 then
        entity.isDead = true
      end

    elseif entity.isDead  and checkTimer("dead", entity.timers) == false then
      addTimer(0.6, "dead", entity.timers)
      entity.explode:setPitch(love.math.random(7, 14) * 0.1)
      entity.explode:play()
      entity.curAnim = 3
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
  spriteSheet = "img/moonTurret.png",
  spriteGrid = {x = 16, y = 16, w = 48, h = 48},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid(1, 1), 0.25), -- 1 idle
      anim8.newAnimation(grid(2, 1), 0.25), -- 2 shot
      anim8.newAnimation(grid("1-3", "2-3", 3, 1), 0.1, "pauseAtEnd"), -- 3 shot
    }
    return animations
  end,
}

return moonTurret

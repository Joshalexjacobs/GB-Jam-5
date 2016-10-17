-- moonTurretPlus.lua -- an enemy

local moonTurretPlus = {
  hp = 15,
  w = 14,
  h = 14,
  offX = 1,
  offY = 1,
  name = "moonTurretPlus",
  speed = 0,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      if checkTimer("shoot", entity.timers) == false and checkTimer("reset", entity.timers) == false then
        addTimer(1.5, "shoot", entity.timers)
      end

      if checkTimer("shoot", entity.timers) and updateTimer(dt, "shoot", entity.timers) and checkTimer("reset", entity.timers) == false then
        entity.curAnim = 2
        addEBullet(entity.x + 6, entity.y + 10, math.pi / 2, 0.8, world)
        addEBullet(entity.x + 6, entity.y + 10, math.pi/3, 0.8, world)
        addEBullet(entity.x + 6, entity.y + 10, 2 * math.pi/3, 0.8, world)
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

    elseif entity.isDead then
      entity.playDead = true
    end
  end,
  spriteSheet = "img/moonTurret.png",
  spriteGrid = {x = 16, y = 16, w = 48, h = 16},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid(1, 1), 0.25), -- 1 idle
      anim8.newAnimation(grid(2, 1), 0.25), -- 2 shot
    }
    return animations
  end,
}

return moonTurretPlus

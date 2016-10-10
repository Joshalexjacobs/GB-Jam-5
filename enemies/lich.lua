-- lich.lua -- an enemy

local lich = {
  hp = 100, -- 100
  w = 48,
  h = 55,
  offX = 8,
  offY = 1,
  name = "lich",
  speed = 15,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      entity.dy = 0.15 * math.sin(love.timer.getTime() * 0.5 * math.pi)

      if checkTimer("shoot", entity.timers) == false then
        addTimer(3.5, "shoot", entity.timers)
      end

      if updateTimer(dt, "shoot", entity.timers) then
        addEBullet(entity.x + entity.w/2, entity.y + entity.h, math.pi / 2, 0.8, world)
        addEBullet(entity.x + entity.w/2, entity.y + entity.h, math.pi/3, 0.8, world)
        addEBullet(entity.x + entity.w/2, entity.y + entity.h, 2 * math.pi/3, 0.8, world)
        addTimer(0.3, "secondShot", entity.timers)
        deleteTimer("shoot", entity.timers)
      end

      if updateTimer(dt, "secondShot", entity.timers) then
        addEBullet(entity.x + entity.w/2, entity.y + entity.h, math.pi / 2, 0.5, world)
        addEBullet(entity.x + entity.w/2, entity.y + entity.h, math.pi / 2 + 0.25, 0.5, world)
        addEBullet(entity.x + entity.w/2, entity.y + entity.h, math.pi / 2 - 0.25, 0.5, world)
        deleteTimer("secondShot", entity.timers)
      end

      if checkTimer("crabs", entity.timers) == false then
        addTimer(8.0, "crabs", entity.timers)
      end

      if updateTimer(dt, "crabs", entity.timers) then
        addEnemy(-20, entity.y + 10, "moonCrab", world)
        addEnemy(180, entity.y + 10, "moonCrab", world)
        addEnemy(-60, entity.y + 5, "moonCrab", world)
        addEnemy(210, entity.y + 5, "moonCrab", world)
        deleteTimer("crabs", entity.timers)
      end

      if checkTimer("astros", entity.timers) == false then
        addTimer(20.0, "astros", entity.timers)
      end

      if updateTimer(dt, "astros", entity.timers) then
        addEnemy(-20, entity.y + 10, "astroHead", world)
        addEnemy(180, entity.y + 10, "astroHead", world)
        deleteTimer("astros", entity.timers)
      end

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
    end
  end,
  spriteSheet = "img/lichBIG.png",
  spriteGrid = {x = 64, y = 64, w = 192, h = 128},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid("1-3", 1, 1, 2), 0.1), -- 1 floating
    }
    return animations
  end,
  filter = function(item, other)
    if other.type == "player" then
      return 'cross'
    end
  end,
}

return lich

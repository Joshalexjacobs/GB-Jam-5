-- astroHead.lua -- an enemy

local astroHead = {
  hp = 35,
  w = 14,
  h = 14,
  offX = 1,
  offY = 1,
  name = "astroHead",
  speed = 12,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      if checkTimer("follow", entity.timers) == false then
        addTimer(1.5, "follow", entity.timers)
      end

      if checkTimer("follow", entity.timers) and checkTimer("shoot", entity.timers) == false then
        local angle = math.atan2(entity.y - player.y, entity.x - player.x)
        entity.dx = -math.cos(angle) * dt * entity.speed
        entity.dy = -math.sin(angle) * dt * entity.speed
      end

      if updateTimer(dt, "follow", entity.timers) then
        addTimer(0.7, "shoot", entity.timers)
        entity.dx, entity.dy = 0, 0
        entity.curAnim = 2
      end

      if checkTimer("shoot", entity.timers) and updateTimer(dt, "shoot", entity.timers) == true and checkTimer("shot1", entity.timers) == false then
        --addEBullet(entity.x + 6, entity.y + 10, math.pi/3, 0.5, world)
        addEBullet(entity.x + 6, entity.y + 10, math.pi/3 - 0.07, 0.75, world)
        addEBullet(entity.x + 6, entity.y + 10, math.pi/3 + 0.07, 0.75, world)
        addTimer(0.2, "shot1", entity.timers)
      end

      if updateTimer(dt, "shot1", entity.timers) and checkTimer("shot2", entity.timers) == false then
        --addEBullet(entity.x + 6, entity.y + 10, math.pi / 2.5, 0.5, world)
        addEBullet(entity.x + 6, entity.y + 10, math.pi / 2.5 - 0.07, 0.75, world)
        addEBullet(entity.x + 6, entity.y + 10, math.pi / 2.5 + 0.07, 0.75, world)
        addTimer(0.2, "shot2", entity.timers)
      end

      if updateTimer(dt, "shot2", entity.timers) and checkTimer("shot3", entity.timers) == false then
        --addEBullet(entity.x + 6, entity.y + 10, math.pi / 2, 0.5, world)
        addEBullet(entity.x + 6, entity.y + 10, math.pi / 2 - 0.07, 0.75, world)
        addEBullet(entity.x + 6, entity.y + 10, math.pi / 2 + 0.07, 0.75, world)
        addTimer(0.2, "shot3", entity.timers)
      end

      if updateTimer(dt, "shot3", entity.timers) and checkTimer("shot4", entity.timers) == false then
        --addEBullet(entity.x + 6, entity.y + 10, math.pi / 1.5, 0.5, world)
        addEBullet(entity.x + 6, entity.y + 10, math.pi / 1.5 - 0.07, 0.75, world)
        addEBullet(entity.x + 6, entity.y + 10, math.pi / 1.5 + 0.07, 0.75, world)
        addTimer(0.2, "shot4", entity.timers)
      end

      if updateTimer(dt, "shot4", entity.timers) then
        entity.timers = {}
        entity.curAnim = 3
        entity.animations[2]:gotoFrame(1)
        entity.animations[2]:resume()
        entity.animations[3]:gotoFrame(1)
        entity.animations[3]:resume()
      end

      if entity.hp <= 0 then
        entity.isDead = true
      end

    elseif entity.isDead and checkTimer("dead", entity.timers) == false then
      addTimer(0.6, "dead", entity.timers)
      entity.explode:setPitch(love.math.random(7, 14) * 0.1)
      entity.explode:play()
      entity.curAnim = 4
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
  spriteSheet = "img/astroHead.png",
  spriteGrid = {x = 16, y = 16, w = 48, h = 96},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid("1-2", 1), {love.math.random(5, 20) * 0.1, 0.1}), -- 1 floating
      anim8.newAnimation(grid("1-3", "2-3", 1, 4), 0.1, "pauseAtEnd"), -- 2 shooting
      anim8.newAnimation(grid("3-1", "3-2", 1, 1), 0.1, "pauseAtEnd"), -- 3 reset
      anim8.newAnimation(grid("1-3", "5-6", 3, 1), 0.1, "pauseAtEnd"), -- 4 dying
    }
    return animations
  end,
}

return astroHead

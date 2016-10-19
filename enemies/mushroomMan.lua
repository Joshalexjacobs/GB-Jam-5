-- mushroomMan.lua -- an enemy

local mushroomMan = {
  hp = 10,
  w = 14,
  h = 14,
  offX = 1,
  offY = 1,
  name = "mushroomMan",
  speed = 20,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      if player.y <= entity.y + 60 and checkTimer("stand", entity.timers) == false or entity.hp < 5 and checkTimer("stand", entity.timers) == false then
        entity.curAnim = 2
        addTimer(0.3, "stand", entity.timers)
      end

      if updateTimer(dt, "stand", entity.timers) and entity.curAnim == 2 then
        entity.curAnim = 3
      end

      if entity.curAnim == 3 then
        local angle = math.atan2(entity.y - player.y, entity.x - player.x)
        entity.dx = -math.cos(angle) * dt * entity.speed
        entity.dy = -math.sin(angle) * dt * entity.speed
      end

      if entity.hp <= 0 then
        entity.isDead = true
      end

<<<<<<< HEAD
    elseif entity.isDead then
=======
    elseif entity.isDead and checkTimer("dead", entity.timers) == false then
      -- shoot in 4 directions after death
      addEBullet(entity.x + 6, entity.y + 10, math.pi, 0.15, world) -- left
      addEBullet(entity.x + 6, entity.y + 10, 2*math.pi, 0.15, world) -- right
      addEBullet(entity.x + 6, entity.y + 10, 3*math.pi/2, 0.15, world) -- up
      addEBullet(entity.x + 6, entity.y + 10, math.pi/2, 0.15, world) -- down

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
>>>>>>> 22b61809b01e6c5c891478f7872f61c536fbc257
      entity.playDead = true
    end
  end,
  spriteSheet = "img/mushroomMan.png",
  spriteGrid = {x = 16, y = 16, w = 48, h = 80},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid(1, 1), 0.15), -- 1 mush
      anim8.newAnimation(grid("2-3", 1), 0.15, "pauseAtEnd"), -- 2 stand
      anim8.newAnimation(grid("1-3", 2), 0.15), -- 3 chase
      anim8.newAnimation(grid("1-3", "3-4", 1, 5), 0.1, "pauseAtEnd"), -- 4 dying
    }
    return animations
  end,
}

return mushroomMan

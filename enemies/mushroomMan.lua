-- mushroomMan.lua -- an enemy

local mushroomMan = {
  hp = 5,
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

    elseif entity.isDead then
      entity.playDead = true
    end
  end,
  spriteSheet = "img/mushroomMan.png",
  spriteGrid = {x = 16, y = 16, w = 48, h = 32},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid(1, 1), 0.15), -- 1 mush
      anim8.newAnimation(grid("2-3", 1), 0.15, "pauseAtEnd"), -- 2 stand
      anim8.newAnimation(grid("1-3", 2), 0.15), -- 1 chase
    }
    return animations
  end,
}

return mushroomMan

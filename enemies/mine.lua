-- mine.lua -- an enemy

local mine = {
  hp = 10,
  w = 14,
  h = 14,
  offX = 1,
  offY = 1,
  name = "mine",
  type = "mine",
  speed = 40,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      -- do nothing until curAnim is 2 signifying the player has touched the mine
      if entity.curAnim == 2 and checkTimer("blink", entity.timers) == false then
        addTimer(1.4, "blink", entity.timers)
      end

      if updateTimer(dt, "blink", entity.timers) and checkTimer("explode", entity.timers) == false then
        addTimer(0.3, "explode", entity.timers)
        entity.curAnim = 3
        entity.type = "enemy"
        entity.collision = function(cols, len)
          for j = 1, len do
            if cols[j].other.type == "player" then
              cols[j].other:kill()
            end
          end
        end
      end

      if updateTimer(dt, "explode", entity.timers) and checkTimer("die", entity.timers) == false then
        entity.type = "dead"
        addTimer(0.4, "die", entity.timers)
      end

      if updateTimer(dt, "die", entity.timers) then
        entity.isDead = true
      end
    end
  end,
  spriteSheet = "img/mine.png",
  spriteGrid = {x = 15, y = 15, w = 45, h = 75},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid(1, 1), 0.1), -- 1 idle
      anim8.newAnimation(grid("2-3", 1, "1-3", 2, "1-2", 3), 0.2, "pauseAtEnd"), -- 2 blink
      anim8.newAnimation(grid("1-3", "4-5", 3, 3), 0.1, "pauseAtEnd"), -- 3 explode
    }
    return animations
  end,
  filter = function(item, other)
    if other.type == "player" then
      return 'cross'
    end
  end,
  collision = function(cols, len)
    for j = 1, len do
      if cols[j].other.type == "player" then
        -- do nothing
      end
    end
  end
}

return mine

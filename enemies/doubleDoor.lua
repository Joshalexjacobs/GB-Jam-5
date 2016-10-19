-- doubleDoor.lua -- an enemy

local doubleDoor = {
  hp = 20,
  w = 31,
  h = 30,
  offX = 1,
  offY = 1,
  name = "doubleDoor",
  speed = 0,
  behaviour = function(dt, entity, world)
    if entity.hp <= 0 then
      entity.isDead = true
    end

    if entity.isDead  and checkTimer("dead", entity.timers) == false then
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
  spriteSheet = "img/doubleDoor.png",
  spriteGrid = {x = 32, y = 32, w = 96, h = 96},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid(1, 1), 0.15), -- 1 static
      anim8.newAnimation(grid("1-3", "2-3", 2, 1), 0.1), -- 2 dying
    }
    return animations
  end,
  filter = function(item, other)
    if other.type == "player" then
      return 'slide'
    end
  end,
  collision = function(cols, len)
  end,
}

return doubleDoor

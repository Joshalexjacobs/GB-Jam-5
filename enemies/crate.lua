-- crate.lua -- an enemy

local crate = {
  hp = 3,
  w = 15,
  h = 15,
  offX = 1,
  offY = 1,
  name = "crate",
  type = "crate",
  speed = 20,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      if entity.hp <= 0 then
        entity.isDead = true
        addTimer(0.7, "dead", entity.timers)
        entity.curAnim = 2
        entity.type = "dead"
        addUpgrade(entity.x, entity.y, world, "SPREAD")
      end
    elseif updateTimer(dt, "dead", entity.timers) then
      entity.playDead = true
    end
  end,
  spriteSheet = "img/crate.png",
  spriteGrid = {x = 16, y = 16, w = 48, h = 48},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid(1, 1), 0.1), -- 1 idle
      anim8.newAnimation(grid("1-3", "2-3", 1, 2), 0.1, "pauseAtEnd"), -- 2 dead
    }
    return animations
  end,
  filter = function(item, other)
  end,
  collision = function(cols, len)
  end,
}

return crate

-- doubleDoor.lua -- an enemy

local doubleDoor = {
  hp = 10,
  w = 31,
  h = 30,
  offX = 1,
  offY = 1,
  name = "doubleDoor",
  speed = 0,
  behaviour = function(dt, entity, world)
    -- literally nothing
  end,
  spriteSheet = "img/doubleDoor.png",
  spriteGrid = {x = 32, y = 32, w = 32, h = 32},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid(1, 1), 0.15), -- 1 static
    }
    return animations
  end,
  filter = nil,
  collision = function(cols, len)
  end,
}

return doubleDoor

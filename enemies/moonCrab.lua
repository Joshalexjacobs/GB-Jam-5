-- mooncrab.lua -- an enemy

local moonCrab = {
  hp = 2,
  w = 14,
  h = 14,
  offX = 1,
  offY = 1,
  name = "moonCrab",
  speed = 40,
  behaviour = function(dt, entity, world)
    if entity.isDead == false then
      local angle = math.atan2(entity.y - player.y, entity.x - player.x)
      entity.dx = -math.cos(angle) * dt * entity.speed
      entity.dy = -math.sin(angle) * dt * entity.speed

      if entity.hp <= 0 then
        entity.isDead = true
      end

    elseif entity.isDead then
      entity.playDead = true
    end
  end,
  spriteSheet = "img/moonCrab.png",
  spriteGrid = {x = 16, y = 16, w = 48, h = 16},
  animations = function(grid)
    animations = {
      anim8.newAnimation(grid("1-2", 1, 1, 1, 3, 1), 0.1), -- 1 running
    }
    return animations
  end,
}

return moonCrab

-- checkPoint.lua

local checkPoint = 2

function loadOutsideMoon(world)
  addEnemy(65, 1938, "doubleDoor", world)

  addEnemy(102, 2095, "moonTurret", world)
  addEnemy(50, 2100, "moonTurret", world)

  addEnemy(40, 2250, "moonBug", world)
  addEnemy(90, 2250, "moonBug", world)

  addEnemy(70, 2300, "moonTurret", world)

  addEnemy(150, 2364, "moonCrab", world)
  addEnemy(125, 2365, "moonCrab", world)
  addEnemy(100, 2366, "moonCrab", world)
  addEnemy(75, 2367, "moonCrab", world)
  addEnemy(50, 2368, "moonCrab", world)
  addEnemy(25, 2369, "moonCrab", world)
  addEnemy(0, 2370, "moonCrab", world)

  addEnemy(0, 2432, "centipede", world)
  addEnemy(30, 2432, "centipede", world)
  addEnemy(70, 2432, "centipede", world)
  addEnemy(100, 2432, "centipede", world)
  addEnemy(130, 2432, "centipede", world)

  addEnemy(0, 2455, "centipede", world)
  addEnemy(30, 2455, "centipede", world)
  addEnemy(70, 2455, "centipede", world)
  addEnemy(100, 2455, "centipede", world)
  addEnemy(130, 2455, "centipede", world)

  addEnemy(70, 2480, "centipede", world)

  addEnemy(125, 2490, "moonBug", world)
  addEnemy(25, 2490, "moonBug", world)

  addEnemy(25, 2510, "moonBug", world)
  addEnemy(100, 2510, "moonCrab", world)

  addEnemy(70, 2520, "moonCrab", world)

  addEnemy(25, 2530, "moonBug", world)
  addEnemy(100, 2530, "moonCrab", world)

  addEnemy(70, 2545, "moonCrab", world)

  addEnemy(100, 2565, "moonCrab", world)
  addEnemy(25, 2565, "moonCrab", world)

  addEnemy(70, 2580, "moonCrab", world) -- FIRST ENEMY
end

function loadMoonBase(world)
  addEnemy(90, 1380, "astroHead", world)
  addEnemy(110, 1380, "astroHead", world)

  addEnemy(100, 1450, "moonTurretPlus", world)

  addEnemy(25, 1515, "mine", world)
  addEnemy(64, 1515, "mine", world)
  addEnemy(99, 1515, "mine", world)

  addEnemy(15, 1555, "mine", world)
  addEnemy(54, 1555, "mine", world)
  addEnemy(89, 1555, "mine", world)

  addEnemy(50, 1535, "astroHead", world) -- for draw order

  addEnemy(40, 1600, "moonTurret", world)
  addEnemy(60, 1605, "moonTurret", world)
  addEnemy(80, 1600, "moonTurret", world)
  addEnemy(100, 1605, "moonTurret", world)

  addEnemy(40, 1650, "astroHead", world)

  addEnemy(75, 1700, "astroHead", world)

  addEnemy(20, 1780, "moonTurretPlus", world)
  addEnemy(70, 1760, "moonBug", world)
  addEnemy(130, 1780, "moonTurretPlus", world)

  addEnemy(40, 1830, "moonTurretPlus", world)
  addEnemy(70, 1810, "moonBug", world)
  addEnemy(105, 1830, "moonTurretPlus", world) -- FIRST ENEMY
end

function loadMoonRuins(world)

end

function loadLich(world)

end

function loadCheckPoint(world)
  if checkPoint == 1 then
    loadOutsideMoon(world)
  elseif checkPoint == 2 then
    loadMoonBase(world)
  elseif checkPoint == 3 then
    -- moon ruins
  else
    -- final boss
  end
end

function updateCheckPoint(world)
  -- more later
  if checkPoint == 1 then
    if player.y < 1930 then
      checkPoint = 2
      player.checkPoint = 1930
      loadMoonBase(world)
    end
  end
end

return checkPoint

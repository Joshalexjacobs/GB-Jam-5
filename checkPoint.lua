-- checkPoint.lua

local checkPoint = 1

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
  addEnemy(70, 980, "astroHead", world)

  addEnemy(125, 1100, "mine", world)
  addEnemy(105, 1130, "mine", world)
  addEnemy(105, 1150, "mine", world)
  addEnemy(105, 1170, "mine", world)

  addEnemy(90, 1100, "astroHead", world) -- comes before mines so it draws on top

  addEnemy(113, 1218, "doubleDoor", world)

  addEnemy(140, 1250, "moonBug", world)
  addEnemy(120, 1280, "moonBug", world)
  addEnemy(90, 1280, "moonBug", world)
  addEnemy(60, 1280, "moonBug", world)
  addEnemy(40, 1300, "moonBug", world)

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
  addEnemy(98, 185, "mushroomMan", world)
  addEnemy(30, 190, "mushroomMan", world)
  addEnemy(82, 210, "mushroomMan", world)
  addEnemy(122, 220, "mushroomChild", world)
  addEnemy(130, 235, "mushroomMan", world)
  addEnemy(99, 240, "mushroomChild", world)
  addEnemy(22, 259, "mushroomMan", world)

  addEnemy(98, 271, "mushroomMan", world)
  addEnemy(28, 274, "mushroomChild", world)
  addEnemy(56, 282, "mushroomMan", world)
  addEnemy(103, 285, "mushroomChild", world)
  addEnemy(22, 298, "mushroomMan", world)
  addEnemy(40, 299, "mushroomChild", world)
  addEnemy(122, 310, "mushroomMan", world)
  addEnemy(85, 318, "mushroomChild", world)
  addEnemy(75, 320, "mushroomMan", world)

  addEnemy(122, 340, "mushroomChild", world)
  addEnemy(110, 348, "mushroomChild", world)
  addEnemy(23, 350, "mushroomChild", world)
  addEnemy(45, 355, "mushroomChild", world)
  addEnemy(72, 364, "mushroomChild", world)
  addEnemy(74, 368, "mushroomChild", world)
  addEnemy(132, 369, "mushroomMan", world)
  addEnemy(76, 370, "mushroomChild", world)
  addEnemy(113, 371, "mushroomChild", world)
  addEnemy(100, 378, "mushroomChild", world)
  addEnemy(120, 385, "mushroomChild", world)
  addEnemy(19, 393, "mushroomChild", world)
  addEnemy(96, 400, "mushroomChild", world)
  addEnemy(25, 403, "mushroomMan", world)
  addEnemy(46, 409, "mushroomChild", world)
  addEnemy(23, 419, "mushroomChild", world)
  addEnemy(133, 428, "mushroomChild", world)
  addEnemy(52, 437, "mushroomChild", world)
  addEnemy(15, 450, "mushroomChild", world)
  addEnemy(120, 455, "mushroomChild", world)
  addEnemy(60, 475, "mushroomChild", world)
  addEnemy(75, 486, "mushroomMan", world)
  addEnemy(50, 490, "mushroomChild", world)
  addEnemy(20, 500, "mushroomChild", world)

  addEnemy(130, 600, "mushroomChild", world)
  addEnemy(34, 605, "mushroomChild", world)
  addEnemy(80, 635, "mushroomChild", world)
  addEnemy(120, 665, "mushroomChild", world)
  addEnemy(45, 689, "mushroomChild", world)
  addEnemy(80, 705, "mushroomChild", world)

  addEnemy(70, 800, "mushroomMan", world) -- FIRST ENEMY
end

function loadLich(world)
  addEnemy(0, 10, "lich", world)
end

function loadCheckPoint(world)
  if checkPoint == 1 then
    loadOutsideMoon(world)
  elseif checkPoint == 2 then
    loadMoonBase(world)
  elseif checkPoint == 3 then
    loadMoonRuins(world)
  else
    loadLich(world)
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
  elseif checkPoint == 2 then
    if player.y < 900 then
      checkPoint = 3
      player.checkPoint = 900
      loadMoonRuins(world)
    end
  elseif checkPoint == 3 then
    if player.y <= 160 then
      checkPoint = 4
      player.checkPoint = 160
      loadLich(world)
    end
  end
end

return checkPoint

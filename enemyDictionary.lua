-- enemyDictionary.lua

local moonBug = require "enemies/moonBug"
local moonCrab = require "enemies/moonCrab"
local centipede = require "enemies/centipede"
local moonTurret = require "enemies/moonTurret"
local moonTurretPlus = require "enemies/moonTurretPlus"
local doubleDoor = require "enemies/doubleDoor"
local astroHead = require "enemies/astroHead"
local mine = require "enemies/mine"

local enemyDictionary = {
  {name = "moonBug", enemy = moonBug},
  {name = "moonCrab", enemy = moonCrab},
  {name = "centipede", enemy = centipede},
  {name = "moonTurret", enemy = moonTurret},
  {name = "moonTurretPlus", enemy = moonTurretPlus},
  {name = "doubleDoor", enemy = doubleDoor},
  {name = "astroHead", enemy = astroHead},
  {name = "mine", enemy = mine},
}

function getEnemy(enemy)
  for i = 1, #enemyDictionary do
    if enemy.name == enemyDictionary[i].name then
      enemy.hp, enemy.speed = enemyDictionary[i].enemy.hp, enemyDictionary[i].enemy.speed
      enemy.w, enemy.h = enemyDictionary[i].enemy.w, enemyDictionary[i].enemy.h
      enemy.offX, enemy.offY = enemyDictionary[i].enemy.offX, enemyDictionary[i].enemy.offY
      enemy.behaviour = enemyDictionary[i].enemy.behaviour
      enemy.spriteSheet = maid64.newImage(enemyDictionary[i].enemy.spriteSheet)
      enemy.spriteGrid = anim8.newGrid(enemyDictionary[i].enemy.spriteGrid.x, enemyDictionary[i].enemy.spriteGrid.y, enemyDictionary[i].enemy.spriteGrid.w, enemyDictionary[i].enemy.spriteGrid.h, 0, 0, 0)
      enemy.animations = enemyDictionary[i].enemy.animations(enemy.spriteGrid)

      if enemyDictionary[i].enemy.filter ~= nil then
        enemy.filter = enemyDictionary[i].enemy.filter
      end

      if enemyDictionary[i].enemy.collsion ~= nil then
        enemy.collsion = enemyDictionary[i].enemy.collsion
      end

      if enemyDictionary[i].enemy.type ~= nil then
        enemy.type = enemyDictionary[i].enemy.type
      end
    end
  end
end

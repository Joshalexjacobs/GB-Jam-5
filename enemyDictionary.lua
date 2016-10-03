-- enemyDictionary.lua

local moonBug = require "enemies/moonBug"

local enemyDictionary = {
  {name = "moonBug", enemy = moonBug},
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
    end
  end
end

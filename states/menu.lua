-- menu.lua
menu = {} -- create game gamestate

require "states/game"

function menu:enter()
  -- load title screen images/fun stuff
  -- twinkle stars in background?
  maid64.setup(160,144) -- set maid64 boundaries (160x144 og Gameboy resolution)
end

function menu:keypressed(key, code)
  if key =='escape' then -- quit on escape
    love.event.quit()
  elseif key == 'space' then -- on space go to next screen
    Gamestate.switch(game)
  end
end

function menu:update()
  -- more stuff
end

function menu:draw()
  maid64.start() -- starts the maid64 process

  love.graphics.printf("sup world, press space to continue", 0, 0, 100)

  maid64.finish() -- finishes the maid64 process
end

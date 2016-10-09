-- controls.lua
controls = {} -- create menu gamestate

require "states/game"

function controls:enter()
  -- load title screen images/sound/music
  select = love.audio.newSource("sfx/select.wav", "static")
  splash = love.audio.newSource("sfx/splash.wav", "static")
  space = love.audio.newSource("music/space.wav")


  -- setup sound and screen
  splash:setVolume(0.5)
  space:setVolume(1)
end

function controls:keypressed(key, code)
  if key =='escape' then -- quit on escape
    love.event.quit()
  elseif key == 'space' or key == 'm' or key == 'n' then -- on space go to next screen
    select:play()
    splash:play()
    Gamestate.switch(game)
  end

  if key == '1' then --- may take this out before release OR only leave it active in the main menu [TAKE OUT BEFORE RELEASE]
      maid64.nextPallet() --you can go to the next pallet in the list during the game
  elseif key == '2' then
      maid64.prevPallet() --you can go to the previous pallet in the list during the game
  end
end

function controls:update()
  if space:isPlaying() == false then
    love.audio.play(space)
  end
end

function controls:draw()
  maid64.start() -- starts the maid64 process

  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, 160, 144)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setFont(bigFont)
  love.graphics.printf("Controls:\n\nWASD - Move\n\nM N - Shoot", 10, 10, 190)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setFont(smallFont)
  love.graphics.printf("1 2 - Change Palette", 15, 130, 160)

  maid64.finish() -- finishes the maid64 process
end

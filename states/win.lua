-- win.lua
win = {} -- create menu gamestate

function win:enter()
  -- load title screen images/sound/music
  bg = maid64.newImage("img/bg.png")
  select = love.audio.newSource("sfx/select.wav", "static")
  splash = love.audio.newSource("sfx/splash.wav", "static")
  space = love.audio.newSource("music/space.wav")

  -- setup sound and screen
  select:setVolume(0.2)
  splash:setVolume(0.2)
  space:setVolume(1)
  maid64.setup(160,144) -- set maid64 boundaries (160x144 og Gameboy resolution)
end

function win:keypressed(key, code)
  if key =='escape' or key == 'space' or key == 'm' or key == 'n' then -- on space quit game
    love.event.quit()
  end

  if key == '1' then --- may take this out before release OR only leave it active in the main menu [TAKE OUT BEFORE RELEASE]
      maid64.nextPallet() --you can go to the next pallet in the list during the game
  elseif key == '2' then
      maid64.prevPallet() --you can go to the previous pallet in the list during the game
  end
end

function win:update()
  if space:isPlaying() == false then
    love.audio.play(space)
  end
end

function win:draw()
  maid64.start() -- starts the maid64 process

  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, 160, 144)
  love.graphics.setColor(255, 255, 255, 255)


  love.graphics.setFont(bigFont)
  love.graphics.draw(bg, 0, 0, 0, 1, 1, 0, 0)

  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 5, 10, 150, 75)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle("line", 5, 10, 150, 75)

  love.graphics.printf("Congrats, Cadet!", 0, 15, 160, 'center')
  love.graphics.setFont(smallFont)
  love.graphics.printf("You defeated the Lunar Lich! The Moon is now safe thanks to you!", 0, 55, 160, 'center')

  maid64.finish() -- finishes the maid64 process
end

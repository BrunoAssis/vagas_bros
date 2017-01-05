require "sprites.AnimatedSprite"

platforms = {
  {"floor",    800, 80, 0, 600 - 80},
  {"platform", 300, 30, 0, 600 - 250},
  {"platform", 300, 30, 500, 350},
  
  --{"platform", 300, 30, 800 - 300, 600 - 250},
  --{"platform", 300, 30, 800 - 300, 600 - 250},
  --{"platform", 300, 30, 800 - 300, 600 - 250},
  
  {"platform", 350, 30, 0, 170},
  {"platform", 350, 30, 450, 170}
}

function love.load()
  love.window.setMode(800, 600)
  MK_sprite = GetInstance("sprites/MKSprite.lua")
end

function love.update(dt)
  UpdateInstance(MK_sprite, dt)
end

function love.draw()
  for i, platform in pairs(platforms) do
    if platform[1] == "floor" then
      color = {255, 0, 0}
    else
      color = {255, 255, 255}
    end

    p_w = platform[2]
    p_h = platform[3]
    p_x = platform[4]
    p_y = platform[5]

    love.graphics.setColor(color)
    love.graphics.rectangle("fill", p_x, p_y, p_w, p_h)
  end

  DrawInstance(MK_sprite, 300, 600-80-32)
end

function love.keypressed(key)
  if key == 'right' then
    MK_sprite.curr_anim = "walking"
    MK_sprite.curr_frame = 1
    MK_sprite.flip_h = 1
  end

  if key == 'left' then
    MK_sprite.curr_anim = "walking"
    MK_sprite.curr_frame = 1
    MK_sprite.flip_h = -1
  end

  if key == 'escape' then
    love.event.quit()
  end
end
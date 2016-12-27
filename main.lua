SCREEN_WIDTH  = love.graphics.getWidth()
SCREEN_HEIGHT = love.graphics.getHeight()

platforms = {
  {"floor",    SCREEN_WIDTH, 80, 0, SCREEN_HEIGHT - 80},
  {"platform",          100, 50, 0, SCREEN_HEIGHT - 160}
}

function love.load()
  love.window.setMode(800, 600)
end

function love.update(dt)
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
end
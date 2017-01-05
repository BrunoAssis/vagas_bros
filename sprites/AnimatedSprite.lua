sprite_bank = {}
image_bank = {}

function LoadSprite(sprite_def)
  if sprite_def == nil then
    return nil
  end

  local definition_file = loadfile(sprite_def)

  if definition_file == nil then
    --Spit out a warning and return nil.
    print("Attempt to load an invalid file (inexistent or syntax errors?): " .. sprite_def)
    return nil
  end

  sprite_bank[sprite_def] = definition_file()
  
  local sprite_sheet = sprite_bank[sprite_def].sprite_sheet
  
  image_bank[sprite_sheet] = love.graphics.newImage(sprite_sheet)
  
  return sprite_bank[sprite_def]
end

function GetInstance(sprite_def)
  if sprite_def == nil then return nil end
  
  if sprite_bank[sprite_def] == nil then
    if LoadSprite (sprite_def) == nil then
      return nil
    end
  end

  return {
    sprite = sprite_bank[sprite_def],
    curr_anim = sprite_bank[sprite_def].animations_names[1],
    curr_frame = 1,
    elapsed_time = 0,
    size_scale = sprite_bank[sprite_def].size_scale,
    time_scale = 1,
    rotation = 0,
    flip_h = 1,
    flip_v = 1
  }
end

function UpdateInstance(spr, dt)
  spr.elapsed_time = spr.elapsed_time + dt

  if spr.elapsed_time > spr.sprite.frame_duration * spr.time_scale then
    if spr.curr_frame < #spr.sprite.animations[spr.curr_anim] then
      spr.curr_frame = spr.curr_frame + 1
    else
      spr.curr_frame = 1
    end

    spr.elapsed_time = 0
  end
end

function DrawInstance(spr, x, y)
  love.graphics.draw(
    image_bank[spr.sprite.sprite_sheet],
    spr.sprite.animations[spr.curr_anim][spr.curr_frame],
    x,
    y,
    spr.rotation,
    spr.size_scale * spr.flip_h,
    spr.size_scale,
    flip_h,
    flip_v
  )
end
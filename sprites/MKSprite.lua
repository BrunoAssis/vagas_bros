local spritesheet_w = 478
local spritesheet_h = 169
local sprite_w = 16
local sprite_h = 32

return {
  sprite_sheet = "sprites/assets/mk.png",
  sprite_name = "MK",

  frame_duration = 0.10,

  size_scale = 3,

  animations_names = {
    "idle",
    "walking",
    "running"
  },

  animations = {
    idle = {
      love.graphics.newQuad(  5, 55, sprite_w, sprite_h, spritesheet_w, spritesheet_h)
    },

    walking = {
      love.graphics.newQuad(  5, 55, sprite_w, sprite_h, spritesheet_w, spritesheet_h),
      love.graphics.newQuad( 22, 55, sprite_w, sprite_h, spritesheet_w, spritesheet_h),
      love.graphics.newQuad( 39, 55, sprite_w, sprite_h, spritesheet_w, spritesheet_h),
      love.graphics.newQuad( 22, 55, sprite_w, sprite_h, spritesheet_w, spritesheet_h),
    },

    running = {
      love.graphics.newQuad(328, 55, sprite_w, sprite_h, spritesheet_w, spritesheet_h)
    }
  }
}
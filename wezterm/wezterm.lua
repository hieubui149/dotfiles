local wezterm = require 'wezterm'
local io = require("io")
local os = require("os")

local config = wezterm.config_builder()
config.font = wezterm.font("SFMono Nerd Font", {
  bold=false,
  italic=false,

})
config.line_height=1.2
config.cell_width = 0.9
config.font_size = 16

-- Window, UI, themes
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.color_scheme = 'Tokyo Night Storm (Gogh)'


-- Image settings
local background_folder = "/Users/hieubui/Pictures/backgrounds/wezterm-bgs/bg"
local function pick_random_background(folder)
  local handle = io.popen('ls "' .. folder .. '"')
  local files = handle:read("*a")
  handle:close()

  local images = {}
  for file in string.gmatch(files, "[^\n]+") do
    table.insert(images, file)
  end

  if #images > 0 then
    return folder .. "/" .. images[math.random(#images)]
  else
    return nil
  end
end

config.keys = {
  {
    key = "b",
    mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window, pane)
      local new_background = pick_random_background(background_folder)
      if new_background then
        window:set_config_overrides({
          window_background_image = new_background,
        })
        wezterm.log_info("New bg:" .. new_background)
      else
        window:set_config_overrides({
          window_background_image = '/Users/hieubui/Pictures/backgrounds/wezterm-bgs/bg/bg3.png',
        })
        wezterm.log_error("Could not find bg image")
      end
    end),
  },
}

config.window_background_opacity = 1
config.macos_window_background_blur = 1
config.window_background_image = '/Users/hieubui/Pictures/backgrounds/wezterm-bgs/bg/bg3.png'
config.window_background_image_hsb = {
  brightness = 1,
  hue = 1,
  saturation = 1.0,
}

return config
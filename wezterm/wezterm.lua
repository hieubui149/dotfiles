local wezterm = require 'wezterm'

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

config.window_background_opacity = 1
config.macos_window_background_blur = 1
config.window_background_image = '/Users/hieubui/Pictures/bg-iterm2.png'
config.window_background_image_hsb = {
  brightness = 1,
  hue = 1,
  saturation = 1.0,
}

return config

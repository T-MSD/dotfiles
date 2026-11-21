local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font 'FiraCode Nerd Font'
config.font_size = 18
config.line_height = 1.05
config.cell_width = 1.02

-- Disable tabs
config.enable_tab_bar = false

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.adjust_window_size_when_changing_font_size = true

-- Apply the theme
config.color_scheme = "GruvboxDarkHard"
-- "Tokyo Night (Gogh)", 'Catppuccin Frappe', Gruvbox Material (Gogh), GruvboxDark, GruvboxDarkHard

-- Remove borders
config.window_decorations = "RESIZE"

-- Remove padding
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Background opacity
config.window_background_opacity = 1
config.macos_window_background_blur = 10

return config

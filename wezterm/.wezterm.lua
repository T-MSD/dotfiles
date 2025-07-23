local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("FiraMono Nerd Font")
config.font_size = 18

-- Disable tabs
config.enable_tab_bar = false

-- Set custom Gruvbox theme
config.color_schemes = {
  ["gruvbox_material_dark_hard"] = {
    foreground = "#D4BE98",
    background = "#1D2021",
    cursor_bg = "#D4BE98",
    cursor_border = "#D4BE98",
    cursor_fg = "#1D2021",
    selection_bg = "#D4BE98",
    selection_fg = "#3C3836",

    ansi = {
      "#1d2021", "#ea6962", "#a9b665", "#d8a657",
      "#7daea3", "#d3869b", "#89b482", "#d4be98"
    },
    brights = {
      "#eddeb5", "#ea6962", "#a9b665", "#d8a657",
      "#7daea3", "#d3869b", "#89b482", "#d4be98"
    },
  },
}

-- Apply the theme
config.color_scheme = "gruvbox_material_dark_hard"

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
config.window_background_opacity = 0.9

return config


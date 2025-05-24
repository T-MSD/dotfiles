return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- optional: set some styles
    require("tokyonight").setup({
      style = "night", -- options: "storm", "moon", "night", "day"
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}

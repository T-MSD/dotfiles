return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    vim.notify = notify
    notify.setup({
      background_colour = "#000000", -- or use "Normal"
      timeout = 3000,
      stages = "fade_in_slide_out",
      render = "default", -- you can use "minimal" or "compact"
    })
  end,
}


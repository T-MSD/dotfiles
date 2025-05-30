return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- optional but recommended
  },
  config = function()
    require("noice").setup({
      -- You can configure the command line, popups, messages, etc.
      cmdline = {
        enabled = true, -- enables the enhanced cmdline UI
      },
      messages = {
        enabled = true,
      },
      popupmenu = {
        enabled = true, -- enables nice autocomplete menu
      },
      presets = {
        bottom_search = true, -- like classic vim cmdline
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    })
  end,
}


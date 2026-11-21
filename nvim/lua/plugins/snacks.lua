-- Always show hidden (dotfiles) and gitignored files in the snacks explorer.
-- Toggle them off in-session with Alt+h / Alt+i (or H / I focused on the list).
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}

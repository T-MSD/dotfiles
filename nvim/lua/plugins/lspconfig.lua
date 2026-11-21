return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- installed automatically via mason, loaded via lspconfig
        pyright = {},

        -- Ruby: use the rbenv-installed ruby-lsp instead of Mason's copy.
        -- The `ruby-lsp` shim resolves to whatever Ruby the CURRENT PROJECT uses
        -- (via its .ruby-version), so you get a per-project language server.
        -- Requires: `gem install ruby-lsp` in each Ruby version you develop with.
        ruby_lsp = {
          mason = false,
          cmd = { "ruby-lsp" },
        },
      },
    },
  },
}

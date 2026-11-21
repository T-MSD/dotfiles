return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- extend (not overwrite) LazyVim's default ensure_installed list
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash", "html", "javascript", "json", "lua", "markdown", "markdown_inline",
        "python", "query", "regex", "tsx", "typescript", "vim", "yaml",
      })
    end,
  },
}

local fallback = {
  colorscheme = "gruvbox",
  repo = "ellisonleao/gruvbox.nvim",
  plugin = "gruvbox.nvim",
  module = "gruvbox",
  background = "dark",
  opts = { contrast = "hard" },
}

local function read_theme()
  package.loaded["config.theme"] = nil
  local ok, t = pcall(require, "config.theme")
  return ok and t or fallback
end

local t = read_theme()
vim.o.background = t.background

vim.api.nvim_create_user_command("ThemeReload", function()
  local n = read_theme()
  vim.o.background = n.background
  pcall(function()
    require("lazy").load({ plugins = { n.plugin } })
  end)
  if n.module ~= "" then
    pcall(function()
      require(n.module).setup(n.opts)
    end)
  end
  local ok, err = pcall(vim.cmd.colorscheme, n.colorscheme)
  if not ok then
    vim.notify("ThemeReload: " .. tostring(err), vim.log.levels.ERROR)
  end
end, { desc = "Re-read config/theme.lua and apply the colorscheme" })

local specs = {
  { "LazyVim/LazyVim", opts = { colorscheme = t.colorscheme } },
}
if t.module ~= "" then
  specs[#specs + 1] = { t.repo, opts = t.opts }
end

return specs

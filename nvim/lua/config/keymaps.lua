-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps for better default experience
-- NOTE: leader keys are set in lua/config/lazy.lua (must run before lazy loads)

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- <C-s> to save (+ format on save) is provided by LazyVim in n/i/x/s modes.

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", opts) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", opts) -- decrement

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits (<leader>w then h/j/k/l)
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Go to left split" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Go to lower split" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Go to upper split" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Go to right split" })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Live Preview (Markdown/HTML/AsciiDoc/SVG in the browser)
vim.keymap.set("n", "<leader>lp", "<cmd>LivePreview start<CR>", { desc = "Live Preview (start)" })
vim.keymap.set("n", "<leader>lP", "<cmd>LivePreview close<CR>", { desc = "Live Preview (close)" })

-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Replace word under cursor
vim.keymap.set("n", "<leader>j", "*``cgn", opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set("n", "<leader>do", function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save and load session
vim.keymap.set("n", "<leader>ss", ":mksession! .session.vim<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>sl", ":source .session.vim<CR>", { noremap = true, silent = false })

-- Toggle focus between the editor and the snacks file explorer
vim.keymap.set("n", "<leader>o", function()
  -- already in the explorer -> jump back to the editor
  if vim.bo.filetype:match("^snacks_picker") then
    vim.cmd("wincmd p")
    return
  end
  -- explorer is open elsewhere -> focus it (prefer the file list window)
  local target
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local ft = vim.bo[vim.api.nvim_win_get_buf(win)].filetype
    if ft == "snacks_picker_list" then
      target = win
      break
    elseif ft:match("^snacks_picker") then
      target = target or win
    end
  end
  if target then
    vim.api.nvim_set_current_win(target)
  else
    require("snacks").explorer() -- not open yet -> open it
  end
end, { desc = "Toggle focus: editor <-> explorer" })

-- Toggle rubocop / style diagnostics (e.g. Layout/LineLength), keeping ruby-lsp
-- and other real LSP diagnostics visible.
-- In LazyVim's Ruby setup, rubocop runs as its OWN LSP client, so its offenses
-- live under the `nvim.lsp.rubocop.*` diagnostic namespace (NOT nvim-lint).
-- We also cover standardrb (the other Ruby style linter) and any nvim-lint namespace.
local style_shown = true
vim.keymap.set("n", "<leader>ud", function()
  style_shown = not style_shown
  for ns_id, ns in pairs(vim.diagnostic.get_namespaces()) do
    local name = (ns.name or ""):lower()
    if name:find("rubocop") or name:find("standardrb") then
      vim.diagnostic.enable(style_shown, { ns_id = ns_id })
    end
  end
  vim.notify("Rubocop/style diagnostics " .. (style_shown and "shown" or "hidden"), vim.log.levels.INFO)
end, { desc = "Toggle Rubocop/Style Diagnostics" })

-- Toggle a full INLINE diff of the whole file (all hunks at once), in-place.
-- Compare: <leader>ghp previews only the hunk under the cursor;
--          <leader>ghd opens a separate split diff view.
vim.keymap.set("n", "<leader>ghi", function()
  local gs = require("gitsigns")
  gs.toggle_linehl() -- highlight added/changed lines
  gs.toggle_deleted() -- show removed lines inline
  gs.toggle_word_diff() -- word-level highlighting within changed lines
end, { desc = "Toggle Inline Diff (whole file)" })

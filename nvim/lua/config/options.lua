-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.netrw_banner = 0

-- Line numbers
opt.nu = true
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}

-- Indentation
opt.tabstop = 4 -- insert n spaces for a tab
opt.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true -- make indenting smarter again
opt.autoindent = true -- copy indent from current line when starting new one
opt.breakindent = true -- Enable break indent

-- Wrapping
opt.wrap = true -- display lines as one long line
opt.linebreak = true -- companion to wrap don't split words
opt.textwidth = 80
opt.whichwrap = "bs<>[]hl" -- which "horizontal" keys are allowed to travel to prev/next line

-- Search
opt.hlsearch = false -- Set highlight on search
opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
opt.smartcase = true -- smart case
opt.inccommand = "split"

-- Splits
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

-- Scrolling
opt.scrolloff = 25 -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`

-- Files / persistence
opt.swapfile = false -- creates a swapfile
opt.backup = false -- creates a backup file
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true -- Save undo history
opt.fileencoding = "utf-8" -- the encoding written to a file

-- Completion
opt.completeopt = "menuone,noselect,fuzzy,nosort" -- Set completeopt to have a better completion experience
opt.pumheight = 10 -- pop up menu height

-- UI
opt.termguicolors = true -- set termguicolors to enable highlight groups
opt.laststatus = 3
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- always show tabs
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.signcolumn = "yes" -- Keep signcolumn on by default
opt.colorcolumn = "0"
opt.cursorline = false -- highlight the current line
opt.conceallevel = 2 -- hide markup chars (e.g. markdown **bold**); LazyVim default
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20" -- block in normal/visual, beam in insert

-- Editing behavior
opt.mouse = "a" -- Enable mouse mode
opt.clipboard:append("unnamedplus") -- Sync clipboard between OS and Neovim.
opt.backspace = "indent,eol,start" -- allow backspace on
opt.updatetime = 250 -- Decrease update time
opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)

opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
opt.isfname:append("@-@")
opt.iskeyword:append("-") -- hyphenated words recognized by searches
opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use

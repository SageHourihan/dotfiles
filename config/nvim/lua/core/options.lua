-- ── Editor options ────────────────────────────────────────────────────────────
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8

-- Behaviour
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.updatetime = 250
opt.timeoutlen = 300

-- Clipboard — sync with system clipboard
opt.clipboard = "unnamedplus"

-- Split direction
opt.splitright = true
opt.splitbelow = true

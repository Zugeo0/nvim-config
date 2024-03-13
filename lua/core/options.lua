-- Set leader key
vim.g.mapleader = " "

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Enable line numbers in relative mode
vim.opt.nu = true
vim.opt.relativenumber = true

-- Disable line wrapping
vim.opt.wrap = false

-- Set undo
vim.opt.undodir = os.getenv("HOME") .."/.vim_undodir"
vim.opt.undofile = true

-- Set min cursor distance from the edge
vim.opt.scrolloff = 4

-- Use terminal gui colors
vim.termguicolors = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Disable search highlighting and enable incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Keep the sign column active always
vim.opt.signcolumn = "yes"


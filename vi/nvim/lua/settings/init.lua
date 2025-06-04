-- lua/settings/init.lua
local set = vim.opt
local cmd = vim.cmd

-- General settings
set.textwidth = 85
set.scrolloff = 999       -- scroll with cursor centered vertically
set.cursorline = true
set.mouse = ""            -- disable mouse
set.background = "dark"
set.number = true
set.colorcolumn = "85"
set.syntax = "on"         -- syntax highlighting
cmd("filetype plugin indent on") -- enable filetype plugins & indent

-- Leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Colorscheme
cmd("colorscheme gruvbox")

-- Keymaps
vim.keymap.set('n', '<Space>', '<C-w>', { noremap = true })
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>', { noremap = true })
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', { noremap = true })

vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('v', 'jk', '<Esc>', { noremap = true })

-- Custom command: copy range or whole file to Arista pb
cmd([[
command! -range=% Pb :<line1>,<line2>w !curl -F c=@- pb
]])

require("settings.fold_markers").setup()
require("settings.system").setup()

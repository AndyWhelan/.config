-- ~/.config/nvim/lua/plugins/todo/keymaps.lua

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Search all todos
keymap("n", "<leader>tt", "<cmd>TodoTelescope<cr>", opts)

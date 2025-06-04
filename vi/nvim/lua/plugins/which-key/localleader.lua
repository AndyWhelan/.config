-- ~/.config/nvim/lua/plugins/which-key/localleader.lua
local wk = require("which-key")

wk.register({
   f = {
      name = "+file",
      f = { ":Telescope find_files<CR>", "Find Files" },
      r = { ":Telescope oldfiles<CR>", "Recent Files" },
   },
   c = {
      name = "+code",
      r = { ":lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
      a = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
   },
   t = {
      name = "+toggle",
      n = { ":set relativenumber!<CR>", "Toggle Relative Number" },
      l = { ":set list!<CR>", "Toggle List" },
   },
}, { prefix = "<localleader>", mode = "n" })

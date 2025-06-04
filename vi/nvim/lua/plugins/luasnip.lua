-- ~/.config/nvim/lua/plugins/luasnip.lua
local ls = require("luasnip")
local ls_vs = require("luasnip.loaders.from_vscode")

ls_vs.lazy_load({ paths = { "./lua/snippets" } })

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
   if ls.choice_active() then
      ls.change_choice(1)
   end
end, {silent = true})

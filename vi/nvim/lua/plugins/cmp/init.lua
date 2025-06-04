-- ~/.config/nvim/lua/plugins/cmp/init.lua
local cmp = require("cmp")
local ls = require("luasnip")

cmp.setup({
   snippet = {
      expand = function(args)
         ls.lsp_expand(args.body)
      end,
   },
   mapping = require("plugins.cmp.mappings").get(),
   formatting = require("plugins.cmp.formatting").get(),
   sources = require("plugins.cmp.sources").get(),
})

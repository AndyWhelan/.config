-- ~/.config/nvim/lua/plugins/luasnip/loader.lua
require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "./lua/snippets" },
})

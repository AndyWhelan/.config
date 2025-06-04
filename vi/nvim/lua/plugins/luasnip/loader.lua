-- ~/.config/nvim/lua/plugins/luasnip/loader.lua
local vs_loader = require("luasnip.loaders.from_vscode")

-- Load custom snippets
vs_loader.lazy_load({ paths = { "./lua/snippets/vs-code-style" } })

-- Load friendly-snippets
vs_loader.lazy_load()

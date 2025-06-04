-- ~/.config/nvim/lua/plugins/lsp/init.lua
local lspconfig = require("lspconfig")
local handlers = require("plugins.lsp.handlers")

require("plugins.lsp.servers.lua_ls").setup(lspconfig, handlers) -- LS-proper
require("plugins.lsp.servers.texlab").setup(lspconfig, handlers)

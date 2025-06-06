-- ~/.config/nvim/lua/plugins/lsp/servers/markdown.lua
local M = {}

M.setup = function(lspconfig, handlers)
   lspconfig.marksman.setup({
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
      filetypes = { "markdown" },
      root_dir = lspconfig.util.root_pattern(".git", "."),
   })
end

return M

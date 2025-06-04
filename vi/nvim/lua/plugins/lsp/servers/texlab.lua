-- plugins/lsp/servers/texlab.lua
local M = {}

M.setup = function(lspconfig, handlers)
   lspconfig.texlab.setup({
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
   })
end

return M

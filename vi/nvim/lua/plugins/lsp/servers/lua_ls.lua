-- ~/.config/nvim/lua/plugins/lsp/servers/lua_ls.lua
local M = {}

M.setup = function(lspconfig, handlers)
   lspconfig.lua_ls.setup({
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
      settings = {
         Lua = {
            diagnostics = {
               globals = { "vim" },
            },
         },
      },
   })
end

return M

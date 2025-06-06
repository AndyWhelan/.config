local M = {}

M.setup = function(lspconfig, handlers)
   local schemastore = require("schemastore")

   lspconfig.jsonls.setup({
      cmd = { "vscode-json-languageserver", "--stdio" },
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
      settings = {
         json = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
         },
      },
   })
end

return M

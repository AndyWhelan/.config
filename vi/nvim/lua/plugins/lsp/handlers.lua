-- ~/.config/nvim/lua/plugins/lsp/handlers.lua
local M = {}

-- Optional: require('cmp_nvim_lsp') for capabilities
M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- Optional: integrate with cmp
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
   M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
end

M.on_attach = function(client, bufnr)
   -- Add general keymaps or plugin integrations here if desired
   -- For example:
   -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
end

return M

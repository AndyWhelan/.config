-- ~/.config/nvim/lua/plugins/cmp/sources.lua
local M = {}

function M.get()
   return {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
   }
end

return M

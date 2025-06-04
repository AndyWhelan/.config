-- ~/.config/nvim/lua/plugins/cmp/formatting.lua
local M = {}

function M.get()
   return {
      format = function(entry, vim_item)
         if entry.source.name == "luasnip" then
            local item = entry:get_completion_item()
            if item and item.data and item.data.luasnip then
               vim_item.abbr = item.data.luasnip.description or item.data.luasnip.name or item.name
            elseif item and item.name then
               vim_item.abbr = item.name
            end
         end

         vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            path = "[Path]",
         })[entry.source.name] or ""

         return vim_item
      end,
   }
end

return M

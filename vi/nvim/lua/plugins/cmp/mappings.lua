-- ~/.config/nvim/lua/plugins/cmp/mappings.lua
local cmp = require("cmp")
local ls = require("luasnip")

local M = {}

function M.get()
   return {
      ["<Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif ls.expand_or_jumpable() then
            ls.expand_or_jump()
         else
            fallback()
         end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif ls.jumpable(-1) then
            ls.jump(-1)
         else
            fallback()
         end
      end, { "i", "s" }),

      ["<CR>"] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Insert,
         select = true,
      }),
   }
end

return M

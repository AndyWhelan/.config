-- ~/.config/nvim/lua/plugins/cmp.lua
local cmp = require("cmp")
local ls = require("luasnip")

cmp.setup({
   snippet = {
      expand = function(args)
         ls.lsp_expand(args.body)
      end,
   },
   mapping = {
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
   },

   formatting = {
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
   },

   sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
   },
})

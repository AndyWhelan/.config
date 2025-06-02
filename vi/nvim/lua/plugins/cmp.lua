return {
   "hrsh7th/nvim-cmp",
   dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
   },
   config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
         mapping = {
            ["<Tab>"] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_next_item()
               elseif vim.fn.col(".") ~= 1 and
                  vim.fn.getline("."):sub(vim.fn.col(".") - 1, vim.fn.col(".") - 1):match("%s") == nil
                  then
                     cmp.complete()
                  else
                     fallback()
                  end
               end, { "i", "s" }),

               ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                     cmp.select_prev_item()
                  else
                     fallback()
                  end
               end, { "i", "s" }),

               ["<CR>"] = cmp.mapping.confirm({ select = true }),
               ["<C-Space>"] = cmp.mapping.complete(),
            },
            sources = {
               { name = "nvim_lsp" },
               { name = "buffer" },
               { name = "path" },
            },
            formatting = {
               format = lspkind.cmp_format({
                  mode = "symbol_text",
                  maxwidth = 50,
               }),
            },
         })
      end,
}

return {
   {
      "neovim/nvim-lspconfig",
      lazy=false,
      priority=1000,
      config = function()
         local lspconfig = require("lspconfig")
         local util = require("lspconfig.util")

         -- TeX files
         lspconfig.texlab.setup {}

         -- MATLAB files
         lspconfig.clangd.setup {
            filetypes = { "matlab" }
         }

         -- Lua files
         lspconfig.lua_ls.setup {
            root_dir = function(fname)
               return vim.loop.fs_realpath(vim.fn.expand("~/.config/vi/nvim"))
            end,
            settings = {
               Lua = {
                  runtime = {
                     version = "LuaJIT",
                  },
                  diagnostics = {
                     globals = { "vim" },
                  },
                  workspace = {
                     checkThirdParty = false,
                     library = {
                        vim.fn.expand("$VIMRUNTIME/lua"),
                        vim.fn.stdpath("config") .. "/lua",
                        --vim.fn.expand("$HOME/test-lua-project"),
                     },
                  },
                  telemetry = { enable = false },
               },
            },
         }
      end,
   },
}

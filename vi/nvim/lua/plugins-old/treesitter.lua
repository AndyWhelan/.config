-- lua/plugins/treesitter.lua
return function(use)
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
         require'nvim-treesitter.configs'.setup {
            ensure_installed = { "lua", "python" },
            highlight = { enable = true },
         }
      end
   }
end

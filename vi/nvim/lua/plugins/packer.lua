local M = {}

function M.setup(packer_bootstrap)
   require('packer').startup(function(use)
      use 'wbthomason/packer.nvim'

      -- Colorscheme
      use 'morhetz/gruvbox'

      use {
         'nvim-lualine/lualine.nvim',
         requires = { 'nvim-tree/nvim-web-devicons', opt = true }
      }

      -- Generic syntax helper
      use {
         "nvim-treesitter/nvim-treesitter",
         run = ":TSUpdate"
      }
      use { --so it can work on text objects
         "nvim-treesitter/nvim-treesitter-textobjects",
         after = "nvim-treesitter",
      }
      use "nvim-treesitter/playground"

      -- Completion
      use 'hrsh7th/nvim-cmp'
      use 'hrsh7th/cmp-nvim-lsp'
      use 'hrsh7th/cmp-buffer'
      use 'hrsh7th/cmp-path'
      use 'hrsh7th/cmp-cmdline'
      use 'saadparwaiz1/cmp_luasnip'

      -- Snippets
      use 'rafamadriz/friendly-snippets'
      use({
         "L3MON4D3/LuaSnip",
         dependencies = { "rafamadriz/friendly-snippets" },
         tag = "v2.*",
         run = "make install_jsregexp"
      })

      -- LSP
      use 'neovim/nvim-lspconfig'

      if packer_bootstrap then
         require('packer').sync()
      end
   end)
end

return M

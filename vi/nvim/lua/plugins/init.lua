-- ~/.config/nvim/lua/plugins/init.lua
local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({
         'git',
         'clone',
         '--depth',
         '1',
         'https://github.com/wbthomason/packer.nvim',
         install_path
      })
      vim.cmd [[packadd packer.nvim]]
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
   use 'wbthomason/packer.nvim' -- Packer can manage itself

   -- Completion plugins
   use 'hrsh7th/nvim-cmp'         -- Autocompletion core plugin
   use 'hrsh7th/cmp-nvim-lsp'     -- LSP source
   use 'hrsh7th/cmp-buffer'       -- Buffer words source
   use 'hrsh7th/cmp-path'         -- File paths
   use 'hrsh7th/cmp-cmdline'      -- Command line completions
   use 'saadparwaiz1/cmp_luasnip' -- Snippet completions

   -- Snippets
   use "rafamadriz/friendly-snippets"
   use 'neovim/nvim-lspconfig'
   use({
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      tag = "v2.*",
      run = "make install_jsregexp"
   })

   if packer_bootstrap then
      require('packer').sync()
   end
end)

-- After packer startup, call other setups
require("plugins.cmp")
require("plugins.luasnip")
require("plugins.lsp")

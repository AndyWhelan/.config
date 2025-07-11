local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({
         'git', 'clone', '--depth', '1',
         'https://github.com/wbthomason/packer.nvim',
         install_path
      })
      vim.cmd [[packadd packer.nvim]]
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

require("plugins.packer").setup(packer_bootstrap)
-- Load plugin-specific setups
require("plugins.cmp")
require("plugins.luasnip")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.todo")
require("plugins.which-key")

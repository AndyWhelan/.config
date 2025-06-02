-- .config/nvim/init.lua
-- Common vim settings
-- vim.lsp.set_log_level("debug")
local common_vim = vim.fn.expand( "~/.common.vim" )
if vim.fn.filereadable( common_vim ) == 1 then
   vim.cmd.source( common_vim )
end

-- Lazy loader
local lazypath = vim.fn.stdpath( "data" ) .. "/lazy/lazy.nvim"
-- `git clone` if not there {{{
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
--  }}}
vim.opt.rtp:prepend( lazypath )
require("lazy").setup( "plugins" )

-- aucommands
require( "augroups" )

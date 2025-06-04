-- .config/nvim/init.lua
local common_vim = vim.fn.expand( "~/.common.vim" ) -- common across nvim and vim
if vim.fn.filereadable( common_vim ) == 1 then
   vim.cmd.source( common_vim )
end

-- plugin manager (packer)
-- {{{ Automatically install packer if not present
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
--}}}
--Boilerplate{{{
require('packer').startup(function(use)
   use 'wbthomason/packer.nvim' -- Packer can manage itself
--}}}
   -- Add your plugins here
   -- */cmp* (completion sources) {{{
   use 'hrsh7th/nvim-cmp'         -- Autocompletion core plugin
   use 'hrsh7th/cmp-nvim-lsp'     -- LSP source
   use 'hrsh7th/cmp-buffer'       -- Buffer words source
   use 'hrsh7th/cmp-path'         -- File paths
   use 'hrsh7th/cmp-cmdline'      -- Command line completions
   use 'saadparwaiz1/cmp_luasnip' -- Snippet completions
   -- }}}
   use "rafamadriz/friendly-snippets"
   -- L3MON4D3/LuaSnip{{{
   use({
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      -- follow latest release.
      tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!:).
      run = "make install_jsregexp"
   }) ---}}}
--Boilerplate{{{
   -- Automatically set up your configuration after cloning packer
   if packer_bootstrap then
      require('packer').sync()
   end
end)
--}}}
local cmp = require("cmp")
local fsnips = require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
local ls_vs = require("luasnip.loaders.from_vscode")
-- cmp setup {{{
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
         select = true, -- auto-select the first item if none is selected
      }),
   },

   --formatting{{{
   formatting = {
      format = function(entry, vim_item)
         -- If this is a luasnip completion item
         if entry.source.name == "luasnip" then
            ---- Always show the trigger text
            --vim_item.abbr = vim_item.abbr or ""
            ---- Show a fixed snippet label or your custom description as menu
            --vim_item.menu = "[Snippet]"
            ---- Optionally change the kind icon to something unique
            --vim_item.kind = "" -- a snippet icon, or text like "Snip"
            -- Try to get the 'name' field from the snippet's completion item data
            local item = entry:get_completion_item()

            ---- Use the name field if present, fallback to default label
            if item ~=nil and item.data ~=nil and item.data.luasnip ~=nil and item.data.luasnip.description then
               vim_item.abbr = item.data.luasnip.description
            elseif item ~= nil and item.data ~= nil and item.data.luasnip ~= nil and item.data.luasnip.name then
               vim_item.abbr = item.data.luasnip.name
            elseif item ~= nil and item.name then
               -- fallback: some snippets might put name at top level
               vim_item.abbr = item.name
            end
         end
         -- Optionally add source name on the right menu
         vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            path = "[Path]",
         })[entry.source.name] or ""
   --}}}
   return vim_item
   end,
   },
   -- Add your sources here
   sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
   },
})
--}}}
-- LuaSnip loading/keymaps{{{
--ls_vs.lazy_load()
-- Key mappings for luasnip {{{
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
   if ls.choice_active() then
      ls.change_choice(1)
   end
end, {silent = true})
-- }}}
-- }}}
ls_vs.lazy_load({ paths = { "./snippets" } })


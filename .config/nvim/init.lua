vim.cmd('source ~/.common.vim')
-- Import/Load External Modules {{{
-- Status Bar Prettification {{{
   lualine = require( 'lualine' )
   lualine.setup {
      options = {
         theme = 'gruvbox',         -- Try 'catppuccin', 'tokyonight', 'everforest', etc.
         section_separators = '',   -- You can use unicode chars like '', or keep it clean
         component_separators = ''
      },
      sections = {
         lualine_a = { 'mode' },
         lualine_b = { 'branch', 'diff' },
         lualine_c = { 'filename' },
         lualine_x = { 'encoding', 'filetype' },
         lualine_y = { 'progress' },
         lualine_z = { 'location' }
      }
   }
   --  }}}
   -- LSP (Language Server Protocol) Support {{{
      local lspconfig = require('lspconfig')  -- individual language support
      local util = require('lspconfig.util')
      lspconfig.texlab.setup{}
      lspconfig.clangd.setup{
         filetypes={'matlab'}
      }
      lspconfig.lua_ls.setup{
         --root_dir = util.root_pattern('.git', 'init.lua'),  -- avoid using ~ as root
         root_dir = function(fname)
            --return util.root_pattern(".git", "init.lua", "Makefile", ".luarocks")(fname) or vim.fn.expand("$HOME")
            return util.path.dirname(fname)
         end,
         --root_dir = util.root_pattern('init.lua'),  -- avoid using ~ as root
         --root_dir = function(fname)
         --   return util.find_git_ancestor(fname) or util.path.dirname(fname)
         --end,
         settings = {
            Lua = {
               runtime = {
                  version = 'LuaJIT',  -- Neovim uses LuaJIT
               },
               diagnostics = {
                  globals = { 'vim' },  -- Remove 'undefined global vim'
               },
               workspace = {
                  checkThirdParty = false,  -- Disable third-party warnings
                  --library = vim.api.nvim_get_runtime_file("", true), -- Include runtime files
                  library = {
                     vim.fn.expand('$VIMRUNTIME/lua'),
                     vim.fn.stdpath('config') .. '/lua',
                     vim.fn.expand('$HOME/test-lua-project'),
                  },
               },
               telemetry = { enable = false },
            },
         },
      }
      local lspkind = require('lspkind')      -- prettify the autocompletion
      -- }}}
      -- Neovim autocompletion {{{
         local cmp = require( 'cmp' )
         cmp.setup({
            mapping = {
               ['<Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                     cmp.select_next_item()
                  elseif vim.fn.col('.') ~= 1 and vim.fn.getline('.'):sub(vim.fn.col('.') - 1, vim.fn.col('.') - 1):match('%s') == nil then
                     cmp.complete()
                  else
                     fallback()
                  end
               end, { 'i', 's' }),

               ['<S-Tab>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                     cmp.select_prev_item()
                  else
                     fallback()
                  end
               end, { 'i', 's' }),

               ['<CR>'] = cmp.mapping.confirm({ select = true }),
               ['<C-Space>'] = cmp.mapping.complete(),
            },

            sources = {
               { name = 'nvim_lsp' },
               { name = 'buffer' },
               { name = 'path' },
            },

            -- Optional: nice menu formatting
            formatting = {
               format = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 }),
            },
         })
         --  }}}
         --  }}}
-- .lua settings {{{
vim.api.nvim_create_augroup('lua_settings', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter','BufReadPre', 'BufNewFile' }, {
   group = 'lua_settings',
   pattern = { '*.lua' },
   callback = function()
      vim.opt_local.foldenable = true
      vim.opt_local.foldmethod = 'marker'
      vim.b.comment = '--'
      vim.cmd('LspStart') -- a hack because I can't figure out what's going wrong with lua_ls
      vim.keymap.set( 'i', '<localleader>tr', "vim.notify(\"\", vim.log.levels.DEBUG)<Esc>F\"i", {buffer=true})
      vim.keymap.set( 'n', '<localleader>lg', ':vsplit ~/.local/state/nvim/lsp.log<CR>', {buffer=true})
   end,
})
vim.api.nvim_create_user_command("ClearLspLog", function()
   vim.fn.writefile({}, vim.lsp.log.get_filename())
   print("LSP log cleared.")
end, {})
   --  }}}

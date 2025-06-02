local M = {}

function M.setup()
   local group = vim.api.nvim_create_augroup( 'lua' , { clear = true })

   vim.api.nvim_create_autocmd( { 'VimEnter', 'BufReadPre', 'BufNewFile' },{
      pattern={ "*.lua", }, -- TODO: File pattern to match
      desc="Settings for .lua files", -- TODO: human-readable description
      group=group,
      callback = function()
         vim.opt_local.foldenable = true
         vim.opt_local.foldmethod = 'marker'
         vim.b.comment = '--'
         vim.cmd( 'LspStart' ) -- a hack because I can't figure out what's going wrong with lua_ls
      end
   })
end

return M

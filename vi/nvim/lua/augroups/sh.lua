-- ~/.config/vi/nvim/lua/augroups/sh.lua
local M = {}

function M.setup()
   local group = vim.api.nvim_create_augroup( 'lua' , { clear = true })

   vim.api.nvim_create_autocmd( { 'BufReadPre', 'BufNewFile' },{
      pattern={
         os.getenv("HOME") .. "/.config/sh",
         os.getenv("HOME") .. "/.config/path",
         os.getenv("HOME") .. "/.config/profile",
         os.getenv("HOME") .. "/.config/rc",
         os.getenv("HOME") .. "/.config/aliases",
         os.getenv("HOME") .. "/.config/env",

         -- Bash
         os.getenv("HOME") .. "/.config/bash/*",

         -- Zsh
         os.getenv("HOME") .. "/.config/zsh/*",
      },
      desc="Settings for .lua files", -- TODO: human-readable description
      group=group,
      callback = function()
         vim.opt_local.foldenable = true
         vim.opt_local.foldmethod = 'marker'
         vim.b.comment = '#'
         vim.bo.filetype = "sh"
      end
   })
end

return M

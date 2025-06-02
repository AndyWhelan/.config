local M = {}

function M.setup()
   local group = vim.api.nvim.create_augroup( '' , { clear = true }) -- TODO: name augroup

   vim.api.nvim_create_autocmd( {'',},{ -- TODO: events - see `:help autocmd-events`
      pattern={ "", }, -- TODO: File pattern to match
      desc="", -- TODO: human-readable description
      group=group,
      callback = function()
         -- TODO: behaviour on trigger
      end
   })
end

return M

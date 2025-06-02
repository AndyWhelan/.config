local M = {}

function M.setup()
   local group = vim.api.nvim_create_augroup('diagnostic_keymaps', { clear = true })

   vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      group = group,
      callback = function()
         vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostics" })
      end,
})
end

return M

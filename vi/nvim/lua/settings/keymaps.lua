-- lua/settings/keymaps.lua
local M = {}

function M.setup()
   vim.keymap.set('n', '<leader>a', function()
      local api = vim.api
      local buf = 0
      local win = 0

      -- Move cursor to first line, column 0
      api.nvim_win_set_cursor(win, {1, 0})

      -- Start characterwise visual mode
      vim.cmd('normal! v')

      -- Get last line number and last column
      local last_line = api.nvim_buf_line_count(buf)
      local last_line_text = api.nvim_buf_get_lines(buf, last_line - 1, last_line, false)[1] or ""
      local last_col = #last_line_text

      -- Move cursor to last line, last column
      api.nvim_win_set_cursor(win, {last_line, last_col})
   end, { desc = 'Select entire file' })
end

return M

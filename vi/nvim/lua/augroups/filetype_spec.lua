local M = {}

function M.setup()
   local group = vim.api.nvim_create_augroup('filetype_spec', { clear = true })
   local shell_patterns = {
      "*.common_*",
      "*.env*",
      "*.shell_*",
      "*.path*",
      "*config/sh/*",
   }
   for _, pattern in ipairs(shell_patterns) do
      vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
         group='filetype_spec',
         pattern = pattern,
         callback = function()
            vim.bo.filetype = "sh"
         end,
   })
   end
end

return M

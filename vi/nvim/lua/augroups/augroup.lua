local M = {}

function M.setup()
   local group = vim.api.nvim_create_augroup('augroup', { clear = true })

   vim.api.nvim_create_autocmd( { 'VimEnter', 'BufNewFile' }, {
      pattern = '*.augroup.lua',
      group = group,
      callback = function(ctx)
         local template_path = vim.fn.expand("~/.config/vi/templates/augroup.lua")
         if vim.fn.filereadable(template_path) == 1 then
            local lines = vim.fn.readfile(template_path)
            -- Only insert if the buffer is empty
            if vim.api.nvim_buf_line_count(0) == 1 and vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] == "" then
               vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
               --vim.notify( "New file: " .. ctx.file )
            end
         else
            vim.notify("Template not found: " .. template_path, vim.log.levels.WARN)
         end
      end,
})
end

return M

local M = {}

function M.setup()
   local group = vim.api.nvim_create_augroup("default_fallback_settings", { clear = true })

   vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile", "VimEnter" }, {
      group = group,
      callback = function()
         -- Set fallback comment and marker values if not already defined
         vim.b.comment = vim.b.comment or "#"
         vim.b.marker_start = vim.b.marker_start or "{{{"
         vim.b.marker_end = vim.b.marker_end or "}}}"

         -- Function to insert fold marker block
         local function insert_fold_marker()
            if not vim.tbl_contains(vim.opt_local.formatoptions:get(), "o") then
               vim.b.line_continue_edit = vim.b.comment
            else
               vim.b.line_continue_edit = ""
            end

            local to_print = vim.b.comment .. "  " .. vim.b.marker_start .. "\n" .. vim.b.line_continue_edit .. vim.b.marker_end
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(to_print, true, false, true), "in", false)
         end

         -- Map <localleader>mf to insert fold markers
         vim.api.nvim_buf_set_keymap(0, "i", "<localleader>mf",
         [[<C-o>:setlocal foldmethod=manual<CR><C-o>:lua vim.b._insert_fold_marker()<CR><Esc>ki<C-o>:setlocal foldmethod=marker<CR><Esc>za0f{hi]],
         { noremap = true, silent = true })

         -- Attach the function to buffer-local so it's callable from the mapping
         vim.b._insert_fold_marker = insert_fold_marker

         -- Set foldmethod only — foldenable is window-local!
         vim.opt_local.foldmethod = "marker"
      end,
   })
end

return M

local M = {}

function M.setup()
   local group = vim.api.nvim_create_augroup( 'tex' , { clear = true })

   vim.api.nvim_create_autocmd( {'BufWritePost',},{
      pattern={ "*.tex", },
      desc=".tex file aucommands",
      group=group,
      command = '!lualatex % && bibtex %:r && lualatex % && lualatex % && chrome_pdf %:r.pdf',
   })
end

return M

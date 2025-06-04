-- lua/plugins/vimtex.lua
return function(use)
   use {
      "lervag/vimtex",
      config = function()
         vim.g.vimtex_view_method = 'skim' -- PDF-viewer
         vim.g.vimtex_compiler_method = 'latexmk'
         vim.g.vimtex_view_continuous = 1
         vim.g.vimtex_compiler_latexmk = {
            continuous = 1,      -- Enable continuous preview (auto-compiling)
            options = { '-pdf', '-lualatex', '-interaction=nonstopmode', '-synctex=1' },  -- Options to pass to latexmk
         }
         vim.g.vimtex_syntax_enabled = 1
      end
   }
end

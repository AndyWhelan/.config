local ll = require( 'lualine' )

ll.setup({
   options = {
      icons_enabled = false,  -- disable nerd font icons here
      theme = 'gruvbox',
      section_separators = '',
      component_separators = '',
   },
   sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
   }
})

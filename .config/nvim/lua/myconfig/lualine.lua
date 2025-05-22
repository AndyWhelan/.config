-- lua/myconfig/lualine.lua
require('lualine').setup {
  options = {
    theme = 'gruvbox',         -- Try 'catppuccin', 'tokyonight', 'everforest', etc.
    section_separators = '',   -- You can use unicode chars like '', or keep it clean
    component_separators = ''
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  }
}

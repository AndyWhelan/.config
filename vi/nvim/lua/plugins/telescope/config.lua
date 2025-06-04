-- ~/.config/nvim/lua/plugins/telescope/config.lua
require("telescope").setup {
   defaults = {
      prompt_prefix = "🔍 ",
      selection_caret = "➤ ",
      path_display = { "smart" },
   }
}

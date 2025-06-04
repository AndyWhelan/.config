-- ~/.config/nvim/lua/plugins/which-key/init.lua
local M = {}

function M.setup()
   require("plugins.which-key.config")
   require("plugins.which-key.localleader")
end

return M

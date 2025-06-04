-- ~/.config/nvim/init.lua

local common_vim = vim.fn.expand("~/.common.vim")
if vim.fn.filereadable(common_vim) == 1 then
   vim.cmd.source(common_vim)
end

require("plugins")
local ag = require("augroups")
ag.setup()

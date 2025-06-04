-- ~/.config/nvim/lua/plugins/which-key/config.lua
local wk = require("which-key")

wk.setup({
   notify=false, -- disable the warnings temporarily
   icons = {
      breadcrumb = ">",
      separator = "",
      group = "",
      mappings=false,
      ellipsis="...",
      keys={
         Up = "^",
         Down = "v",
         Left = "<",
         Right = ">",
         C = "C-",       -- Ctrl
         M = "M-",       -- Meta (Alt)
         D = "D-",       -- Shift (you can also do "S-" if you prefer)
         S = "S-",
         CR = "<CR>",
         Esc = "<Esc>",
         ScrollWheelDown = "<ScrollDn>",
         ScrollWheelUp = "<ScrollUp>",
         NL = "<NL>",
         BS = "<BS>",
         Space = "<Space>",
         Tab = "<Tab>",
         F1 = "<F1>",
         F2 = "<F2>",
         F3 = "<F3>",
         F4 = "<F4>",
         F5 = "<F5>",
         F6 = "<F6>",
         F7 = "<F7>",
         F8 = "<F8>",
         F9 = "<F9>",
         F10 = "<F10>",
         F11 = "<F11>",
         F12 = "<F12>",
   },
 --  window = {
 --     border = "none",
 --     winblend = 0,
 --  },
 --  plugins = {
 --   presets = {
 --     operators = false,
 --     motions = false,
 --     text_objects = false,
 --     windows = false,
 --     nav = false,
 --     z = false,
 --     g = false,
 --   },
 },
})

-- Example: register some key groups or mappings if you want
wk.register({
   { "<leader>f", group = "file" },
   { "<leader>g", group = "git" },
   { "<leader>t", group = "toggle" }
})

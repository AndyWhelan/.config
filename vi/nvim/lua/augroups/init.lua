local M = {}

local uv = vim.loop
local path = vim.fn.stdpath("config") .. "/lua/augroups"

function M.setup()
   local iter, err = uv.fs_scandir(path)
   if not iter then
      vim.notify("Failed to scan augroups dir: " .. err, vim.log.levels.ERROR)
      return
   end

   while true do
      local name = uv.fs_scandir_next(iter)
      if not name then break end

      -- Skip init.lua itself
      if name ~= "init.lua" and name:match("%.lua$") then
         -- Strip ".lua" to get module name
         local mod_name = name:gsub("%.lua$", "")
         local ok, mod = pcall(require, "augroups." .. mod_name)
         if ok and type(mod.setup) == "function" then
            mod.setup()
         else
            vim.notify("Failed to load augroup: " .. mod_name, vim.log.levels.ERROR)
         end
      end
   end
end

return M

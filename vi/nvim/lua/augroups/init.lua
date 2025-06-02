local path = vim.fn.stdpath("config") .. "/lua/augroups"

local iter, err = vim.loop.fs_scandir(path)
if not iter then
   error("Failed to scan augroups dir: " .. err)
end

while true do
   local name = vim.loop.fs_scandir_next(iter)
   if not name then break end
   if name:match("%.augroup.lua$") then
      local fullpath = path .. "/" .. name
      local ok, mod = pcall(dofile, fullpath)
      if ok and type(mod.setup) == "function" then
         mod.setup()
      else
         vim.notify("Failed to load: " .. name, vim.log.levels.ERROR)
      end
   end
end

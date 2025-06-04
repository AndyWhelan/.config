-- lua/settings/system.lua
local M = {}

function M.setup()
   local uv = vim.loop
   local function file_readable(path)
      local stat = uv.fs_stat(path)
      return stat and stat.type == 'file'
   end

   if file_readable("/etc/vimrc") then
      vim.cmd('source /etc/vimrc')
   end

   local vim_env = os.getenv("VIM")
   if vim_env then
      local arista_path = vim_env .. "/vimfiles/arista.vim"
      if file_readable(arista_path) then
         vim.cmd("source " .. arista_path)
      else
         local home_arista = os.getenv("HOME") .. "/.vim/vimfiles/arista.vim"
         if file_readable(home_arista) then
            vim.cmd("source " .. home_arista)
         end
      end
   end
end

return M

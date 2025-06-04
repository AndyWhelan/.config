-- plugins/treesitter/config.lua
require("nvim-treesitter.configs").setup {
   ensure_installed = {
      "lua", "vim", "bash", "python", "javascript", "typescript",
      "json", "html", "css", "markdown", "yaml"
   },
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   },
   indent = {
      enable = true,
   },
   incremental_selection = {
      enable = true,
      keymaps = {
         init_selection = "<leader>v",
         node_incremental = "<leader>]",
         node_decremental = "<leader>[",
         scope_incremental = "<leader>sc",
      },
   },
}

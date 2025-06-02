return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      opts = {
         ensure_installed = { "lua" }, -- add more languages here as needed
         highlight = {
            enable = true,
         },
      },
   },
}

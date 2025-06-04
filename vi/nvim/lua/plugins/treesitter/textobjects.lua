-- plugins/treesitter/textobjects.lua
require("nvim-treesitter.configs").setup {
   textobjects = {
      move = {
         enable = true,
         set_jumps = true,
         goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]p"] = "@parameter.outer",
            ["]C"] = "@comment.outer",
         },
         goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[p"] = "@parameter.outer",
            ["[C"] = "@comment.outer",
         },
         goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@comment.outer",
         },
         goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@comment.outer",
         },
      },
      select = {
         enable = true,
         lookahead = true,
         keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["acond"] = "@conditional.outer",
            ["icond"] = "@conditional.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
            ["aC"] = "@comment.outer",
         },
      },
   },
}

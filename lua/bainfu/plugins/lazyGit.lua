return {
  "kdheepak/lazygit.nvim",
  keys = {
    {
      ";c",
      "<cmd>LazyGit<CR>",
      silent = true,
      noremap = true,

    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

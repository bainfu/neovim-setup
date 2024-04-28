return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        result = {
          split = {
            horizontal = true,
            in_place = false,
            stay_in_current_window_after_split = true

          }
        }
      })
    end,
    keys = {
      {
        "<leader>rest",
        "<cmd>RestNvim<CR>",
        desc = "Open REST client",
      }
    }
  }
}

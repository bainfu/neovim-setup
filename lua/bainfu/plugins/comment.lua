return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    -- local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    -- comment.setup()

    local modes = { "n", "v" }

    for i in pairs(modes) do 

      vim.keymap.set("n", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })
    end
  end,
}

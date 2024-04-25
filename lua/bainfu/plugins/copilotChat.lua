return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    debug = true,
  },
  config = function()
    require("CopilotChat").setup()

    vim.keymap.set("n", "<leader>chat", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })

  end
}

return {
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
 opts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
 },
 config = function()
  -- local actions = require("telescope.actions")
  local trouble = require("trouble.providers.telescope")

  local telescope = require("telescope")

  telescope.setup {
    defaults = {
      mappings = {
        i = { ["<c-t>"] = trouble.open_with_trouble },
        n = { ["<c-t>"] = trouble.open_with_trouble },
      }
    }
  }

  local keymap = vim.keymap -- for conciseness

  -- Lua
  keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Trouble Toggle" })
  keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Trouble Toggle Workspace Diagnostics" })
  keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Trouble Toggle Document Diagnostics" })
  keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Trouble Toggle Quickfix" })
  keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Trouble Toggle Loclist" })
  keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "Trouble Toggle LSP References" })
  
 end
}

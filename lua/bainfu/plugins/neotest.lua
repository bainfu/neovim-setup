return {
  "nvim-neotest/neotest",
  requires = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-playwright",
  },
  configure = function()
    require("neotest").setup({
      adapters = {
        ["neotest-python"] = {},
        ["neotest-jest"] = {
          jestConfigFile = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/lib/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end 
            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          cwd = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/lib/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            return vim.fn.getcwd()
          end
        },
        ["neotest-playwright"] = {},
      },
      disable_all = true,
      enable = {
        "test_nearest",
        "test_file",
        "test_suite",
        "test_last",
        "test_visit"
      },
      keymap = {
        { ";tt", function() require("neotest").run.run() end, desc = "Run test" },
      },
      custom_events = {
        "BufWritePost"
      },
      on_output = function(output)
        print(output)
      end
    })
  end 
}

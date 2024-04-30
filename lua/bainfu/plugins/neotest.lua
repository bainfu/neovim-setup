return {
  {
    "nvim-neotest/neotest-jest", branch = "main",
  },
  {
    "nvim-neotest/neotest-plenary",
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-plenary",
        "neotest-jest",
      },
    },
    keys = {
      { ";tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { ";tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { ";tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
      { ";tl", function() require("neotest").run.run_last() end, desc = "Run All Test Files" },
      { ";ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { ";to", function() require("neotest").output.open({ enter = true, auto_close = true}) end, desc = "Show Ouptut" },
      { ";tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { ";tS", function() require("neotest").run.stop() end, desc = "Stop Tests" },

    },
  }
}

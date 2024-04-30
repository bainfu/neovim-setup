return {
  requires = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
  },
  log_level = 5,
  opts = {
    adapters = {
      ['neotest-plenary'] = {},
      ['neotest-jest'] = {
        jestCommand = function()
          return "npm test --"
        end,
        jestConfigFile = function()
          local jestFile =  vim.fn.getcwd() .. "jest.config.ts"
          print("jestFile: " .. jestFile)
          return jestFile
        end,
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      },
    },
    output = {
      open_on_run = true,
    },
    quickfix = {
      open = function()
        if LazyVim.has('trouble.nvim') then
          require('trouble').open({ mode = 'quickfix', focus = false})
        else
          vim.cmd('copen')
        end
      end,
    }
  },
  keys = {
    { ";tt", function() require('neotest').summary.toggle() end },
    { ";tr", function() require('neotest').run.run() end, desc = "Run nearest" },
  }
}

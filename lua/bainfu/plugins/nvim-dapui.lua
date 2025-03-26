return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,
    },
  },
  lazy = true,
  config = function()

     local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
     if not dap_virtual_text_status_ok then
        print("nvim-dap-virtual-text not found!")
     end

    require("dapui").setup({
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          run_last = "",
          terminate = "⏹︎",
          pause = "⏸︎",
          play = "",
          step_into = "󰆹",
          step_out = "󰆸",
          step_over = "",
          step_back = "",
        },
      },
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      icons = {
        collapsed = "",
        expanded = "",
        current_frame = "",
      },
      layouts = {
        {
          elements = {
            { id = "stacks", size = 0.25 },
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            { id = "repl", size = 0.4 },
            { id = "console", size = 0.6 },
          },
          position = "bottom",
          size = 10,
        },
      },
    })

    local dap, dapui = require("dap"), require("dapui")
    local group = vim.api.nvim_create_augroup("dapui_config", { clear = true })

    -- hide ~ in DAPUI
    vim.api.nvim_create_autocmd("BufWinEnter", {
      group = group,
      pattern = "DAP*",
      callback = function()
        vim.wo.fillchars = "eob: "
      end,
    })
    vim.api.nvim_create_autocmd("BufWinEnter", {
      group = group,
      pattern = "\\[dap\\-repl\\]",
      callback = function()
        vim.wo.fillchars = "eob: "
      end,
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    dap_virtual_text.setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = true,
        virt_text_pos = "eol",
        all_frames = true,
        -- Display debug text as a comment
        commented = true,
        -- Customize virtual text
        display_callback = function(variable, buf, stackframe, node, options)
          if options.virt_text_pos == "inline" then
            return " = " .. variable.value
          else
            return variable.name .. " = " .. variable.value
          end
        end,
     })
  end,
}

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        "leoluz/nvim-dap-go",
        dependencies = { "nvim-dap" },
        cmd = { "DapInstall", "DapUninstall" },
      },
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        keys = {
          { "<leader>dui", "<cmd>lua require'dapui'.toggle()<CR>" },
          { "<leader>dur", "<cmd>lua require'dapui'.open({reset=true})<CR>" },
        },
        config = function()
          local dap, dapui = require "dap", require "dapui"
          dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
          dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
          dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
          dapui.setup()
        end,
      }
    },
    config = function()
      require('dap-go').setup()
      require("mason-nvim-dap").setup({
        automatic_installation = true,
        ensure_installed = { "chrome", "node2" },
        handlers = {}
      })
      local dap = require("dap")
      local js = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require 'dap.utils'.pick_process,
          cwd = "${workspaceFolder}",
        }
      }

      dap.adapters['pwa-node'] = {
        type = 'server',
        command = 'node',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = "node",
          args = { "/Users/toukohallasmaa/.local/bin/js-debug/src/dapDebugServer.js", "${port}" },
        }
      }
      for _, v in ipairs({ "typescriptreact", "javascriptreact", "svelte" }) do
        dap.configurations[v] = js
      end
      for _, v in ipairs({ "typescript", "javascript" }) do
        dap.configurations[v] = js
      end
    end,
    keys = {
      { "<leader>D",     "<cmd>lua require'dap'.continue()<CR>" },
      { "<leader>dq",    "<cmd>lua require'dap'.terminate()<CR>" },
      { "<leader>dn",    "<cmd>lua require'dap'.next()<CR>" },
      { "<leader>d<bs>", "<cmd>lua require'dap'.clear_breakpoints()<CR>" },
      { "<C-n>",         "<cmd>lua require'dap'.step_over()<CR>" },
      { "<leader>dd",    "<cmd>lua require'dap'.step_into()<CR>" },
      { "<leader>dD",    "<cmd>lua require'dap'.step_out()<CR>" },
      { "<leader>db",    "<cmd>lua require'dap'.toggle_breakpoint()<CR>" },
      { "<leader>dB",    "<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('condition: '))<CR>" },
    },
  },
}

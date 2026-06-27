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
        ensure_installed = { "js-debug-adapter" },
        handlers = {}
      })
      local dap = require("dap")

      local js_debug_path = vim.fn.stdpath("data")
        .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

      for _, adapter in ipairs({ "pwa-node", "pwa-chrome" }) do
        dap.adapters[adapter] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = "node",
            args = { js_debug_path, "${port}" },
          }
        }
      end

      -- Per-project configs live in <project>/.vscode/launch.json.
      -- nvim-dap reads them automatically on-demand at
    end,
    keys = {
      { "<leader>D",     "<cmd>lua require'dap'.continue()<CR>" },
      { "<leader>dq",    "<cmd>lua require'dap'.terminate()<CR>" },
      { "<leader>d<bs>", "<cmd>lua require'dap'.clear_breakpoints()<CR>" },
      { "<C-n>",         "<cmd>lua require'dap'.step_over()<CR>" },
      { "<leader>dd",    "<cmd>lua require'dap'.step_into()<CR>" },
      { "<leader>dD",    "<cmd>lua require'dap'.step_out()<CR>" },
      { "<leader>db",    "<cmd>lua require'dap'.toggle_breakpoint()<CR>" },
      { "<leader>dB",    "<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('condition: '))<CR>" },
    },
  },
}

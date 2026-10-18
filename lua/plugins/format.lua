local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
      { "<leader>f", function() require("conform").format({ async = true, lsp_format = "fallback" }) end, silent = true },
    },
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        rust = { "rustfmt" },
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        svelte = prettier,
        css = prettier,
        scss = prettier,
        html = prettier,
        json = prettier,
        yaml = prettier,
      },
      -- only filetypes listed above format on save, everything else stays manual via <leader>f
      format_on_save = { timeout_ms = 1000, lsp_format = "never" },
      -- prettier is skipped in projects without a config, don't warn about it on every save
      notify_no_formatters = false,
      formatters = {
        -- don't reformat projects that don't use prettier
        prettierd = { require_cwd = true },
        prettier = { require_cwd = true },
      },
    },
  },
}

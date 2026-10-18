return {
  {
    "fatih/vim-go",
    config = function()
      vim.g.go_template_autocreate = 0
      vim.g.go_doc_popup_window = 1
      -- gopls runs through vim.lsp, don't start a second instance
      vim.g.go_gopls_enabled = 0
      vim.g.go_fmt_autosave = 0
      vim.g.go_imports_autosave = 0
      vim.g.go_def_mapping_enabled = 0
      vim.g.go_doc_keywordprg_enabled = 0

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("go_format", { clear = true }),
        pattern = "*.go",
        callback = function(event)
          local client = vim.lsp.get_clients({ bufnr = event.buf, name = "gopls" })[1]
          if not client then return end
          local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
          params.context = { only = { "source.organizeImports" } }
          local res = client:request_sync("textDocument/codeAction", params, 1000, event.buf)
          for _, action in ipairs(res and res.result or {}) do
            if action.edit then vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding) end
          end
          vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
        end,
      })
    end,
  }
}

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
    end,
  }
}

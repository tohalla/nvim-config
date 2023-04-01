return {
  {
    "fatih/vim-go",
    config = function()
      vim.g.go_template_autocreate = 0
      vim.g.go_doc_popup_window = 1
      vim.g.go_fmt_command = "gopls"
      vim.g.go_gopls_gofumpt = 1
    end,
  }
}

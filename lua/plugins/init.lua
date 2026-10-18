return {
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",
  "tpope/vim-eunuch",
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    -- vim.ui.input and vim.ui.select only, telescope stays the main picker
    opts = {
      input = { enabled = true },
      picker = { enabled = true, ui_select = true },
    },
  },
}

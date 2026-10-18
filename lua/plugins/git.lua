vim.g.git_messenger_no_default_mappings = true

return {
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.keymap.set("n", "<leader>hz", "<cmd>GitGutterFold<cr>", { silent = true })
    end,
  },
  "tpope/vim-git",
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<leader>gs",    ":Git<cr>",           silent = true },
      { "<leader>gc",    ":Git commit<cr>",    silent = true },
      { "<leader>gm",    ":Git mergetool<cr>", silent = true },
      { "<leader>gl",    ":0Gclog<cr>",        silent = true },
      { "<leader>gL",    ":Gclog %<cr>",       silent = true },
      { "<leader>gb",    ":Git blame<cr>",     silent = true },
      { "<leader>gw",    ":Gwrite<cr>",        silent = true },
      { "<leader>g<BS>", ":Gread<cr>",         silent = true },
      { "<leader>gg",    ":Gdiffsplit!<cr>",   silent = true },
    },
  },
  {
    "rhysd/git-messenger.vim",
    keys = {
      { "<C-b>", ":GitMessenger<cr>", silent = true },
    },
  },
  {
    "pwntester/octo.nvim",
    keys = {
      { "<leader>gp", "<CMD>Octo pr list<CR>", silent = true },
    },
    config = function()
      require("octo").setup()
    end
  },
}

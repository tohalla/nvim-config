return {
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.keymap.set("n", "<leader>hz", "<cmd>GitGutterFold<cr>", { silent = true, noremap = true })
    end,
  },
  "tpope/vim-git",
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<leader>gs",    ":Git<cr>",           silent = true, noremap = true },
      { "<leader>gc",    ":Gcommit<cr>",       silent = true, noremap = true },
      { "<leader>gm",    ":Git mergetool<cr>", silent = true, noremap = true },
      { "<leader>gM",    ":Gmerge<cr>",        silent = true, noremap = true },
      { "<leader>gl",    ":0Gclog<cr>",        silent = true, noremap = true },
      { "<leader>gL",    ":Gclog %<cr>",       silent = true, noremap = true },
      { "<leader>gb",    ":Git blame<cr>",     silent = true, noremap = true },
      { "<leader>gw",    ":Gwrite<cr>",        silent = true, noremap = true },
      { "<leader>g<BS>", ":Gread<cr>",         silent = true, noremap = true },
      { "<leader>gg",    ":Gdiffsplit!<cr>",   silent = true, noremap = true },
    },
  },
  {
    "rhysd/git-messenger.vim",
    keys = {
      { "<C-b>", ":GitMessenger<cr>", silent = true, noremap = true },
    },
  },
  {
    "pwntester/octo.nvim",
    keys = {
      { "<leader>gp", "<CMD>Octo pr list<CR>", silent = true, noremap = true },
    },
    config = function()
      require("octo").setup()
    end
  },
}

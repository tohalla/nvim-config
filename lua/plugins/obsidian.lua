return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = {
    {"<leader>op", "<cmd>ObsidianQuickSwitch<CR>"},
    {"<leader>ow", "<cmd>ObsidianWorkspace<CR>"},
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/personal",
      },
      {
        name = "work",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/work",
      },
    },
  },
}

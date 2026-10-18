return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    keys = {
      { "<leader>op", "<cmd>Obsidian quick_switch<CR>" },
      { "<leader>ow", "<cmd>Obsidian workspace<CR>" },
      { "<leader>ot", "<cmd>Obsidian today<CR>" },
      { "<leader>oT", "<cmd>Obsidian tomorrow<CR>" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = "personal",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/personal",
        },
        {
          name = "upcloud",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/upcloud",
        },
      },
      -- rendering is handled by render-markdown.nvim
      ui = { enable = false },
      checkbox = { order = { " ", "x" } },
      -- [[id|Title]] links
      link = { style = "wiki", format = "shortest" },
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
      note_path_func = function(spec)
        local path = spec.dir / tostring(spec.id)
        return path:with_suffix(".md")
      end,
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>om", "<cmd>RenderMarkdown toggle<CR>", ft = "markdown" },
    },
    opts = {
      file_types = { "markdown" },
      heading = { sign = false, width = "block", right_pad = 1 },
      code = { sign = false, width = "block", right_pad = 1 },
      -- checkbox / callout completions via in-process LSP
      completions = { lsp = { enabled = true } },
    },
  },
}

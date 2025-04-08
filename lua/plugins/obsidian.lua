return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = {
    { "<leader>op", "<cmd>ObsidianQuickSwitch<CR>" },
    { "<leader>ow", "<cmd>ObsidianWorkspace<CR>" },
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
    wiki_link_func = function(opts)
      return require("obsidian.util").wiki_link_id_prefix(opts)
    end,
    markdown_link_func = function(opts)
      return require("obsidian.util").markdown_link(opts)
    end,
  },
}

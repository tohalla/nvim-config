return {
  {
    "machakann/vim-highlightedyank",
    config = function()
      vim.g.highlightedyank_highlight_duration = 200
      vim.g.highlightedyank_highlight_delay = 0
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", silent = true, noremap = true },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    },
    opts = {
      defaults = {
        layout_strategy = "vertical",
        mappings = {
          i = {
            ["<C-k>"] = "move_selection_previous",
            ["<C-j>"] = "move_selection_next",
          },
          n = {
            ["<C-c>"] = "close"
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        },
        live_grep = {
          additional_args = { "--hidden", "--glob", "!.git/*" },
        },
      },
    },
    keys = {
      { "<leader>l", "<cmd>Telescope buffers<cr>",              silent = true },
      { "<leader>p", "<cmd>Telescope find_files<cr>",           silent = true },
      { "<leader>t", "<cmd>Telescope lsp_document_symbols<cr>", silent = true },
      { "",        "<cmd>Telescope live_grep<cr>",            silent = true },
    },
  },
  {
    "kevinhwang91/nvim-bqf",
    opts = {
      auto_resize_height = true
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local current_signature = function()
        local signature = require("lsp_signature").status_line()
        if signature == nil then
          return ""
        end
        return signature.label .. " " .. signature.hint
      end

      require("lualine").setup({
        options = {
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
          show_filename_only = false,
          path = 1,
        },
        sections = {
          lualine_c = { 'filename', current_signature },
        },
        extensions = { 'fzf', 'lazy', 'nvim-tree', 'fugitive' }
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          tab_size = 4,
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          indicator = { style = "icon", icon = "|" },
          max_name_length = 24,
        },
      })
    end
  },
  {
    "kyazdani42/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = true,
      },
    },
    keys = {
      { "<C-n>", "<cmd>NvimTreeFindFile<cr>", silent = true },
    },
  },
  {
    "tversteeg/registers.nvim",
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" },
    },
    cmd = "Registers",
    config = function()
      require("registers").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
  },
  {
    "ray-x/lsp_signature.nvim",
    opts = {
      bind = true,
      hint_enable = false,
      floating_window = false,
      toggle_key = "jl",
      handler_opts = {
        border = "none",
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    requires = 'kevinhwang91/promise-async',
  },
  "ggandor/lightspeed.nvim",
  "tpope/vim-abolish",
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-sleuth",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "wellle/targets.vim",
}

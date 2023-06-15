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
    keys = {
      { "<leader>l", "<cmd>Telescope buffers<cr>",              silent = true },
      { "<leader>p", "<cmd>Telescope find_files<cr>",           silent = true },
      { "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", silent = true },
      { "",         "<cmd>Telescope live_grep<cr>",            silent = true },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup(
        {
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
        }
      )
      telescope.load_extension("fzf")
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    opts = {
      auto_resize_height = true
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        opts = {
          lsp = {
            auto_attach = true
          }
        },
      },
    },
    config = function()
      local navic = require("nvim-navic")
      require("lualine").setup({
        options = {
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
          show_filename_only = false,
          path = 1,
        },
        sections = {
          lualine_c = {
            "filename",
            {
              function()
                return navic.get_location()
              end,
              cond = function()
                return navic.is_available()
              end
            },
          },
        },
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
    "preservim/vim-markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
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
    dependencies = { 'kevinhwang91/promise-async' },
  },
  "ggandor/lightspeed.nvim",
  "tpope/vim-abolish",
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-sleuth",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "wellle/targets.vim",
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-go",
      "marilari88/neotest-vitest",
      "rouge8/neotest-rust",
      "antoinemadec/FixCursorHold.nvim",
    },
    keys = {
      { "]s",         "<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>", silent = true, noremap = true },
      { "[s",         "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>", silent = true, noremap = true },
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",      silent = true, noremap = true },
      { "<leader>tt", "<cmd>lua require('neotest').run.run()<CR>",                        silent = true, noremap = true },
      { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>",                 silent = true, noremap = true },
      { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<CR>",    silent = true, noremap = true },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-go"),
          require("neotest-vitest"),
          require("neotest-rust"),
        },
      })
    end
  }
}

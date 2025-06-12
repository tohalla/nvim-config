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
      { "nvim-telescope/telescope-fzf-native.nvim",     enabled = vim.fn.executable "make" == 1, build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
    },
    keys = {
      { "<leader>l", "<cmd>Telescope buffers<cr>",              silent = true },
      { "<leader>p", "<cmd>Telescope find_files<cr>",           silent = true },
      { "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", silent = true },
      { "",         "<cmd>Telescope live_grep_args<cr>",       silent = true },
    },
    config = function()
      local telescope = require("telescope")
      local lga_actions = require("telescope-live-grep-args.actions")
      telescope.setup(
        {
          defaults = {
            layout_strategy = "vertical",
            mappings = {
              i = {
                ["<C-k>"] = "move_selection_previous",
                ["<C-j>"] = "move_selection_next",
                ["<C-l>"] = lga_actions.quote_prompt(),
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
      telescope.load_extension("live_grep_args")
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    dependencies = {
      'junegunn/fzf',
    },
    ft = "qf",
    opts = {
      auto_resize_height = true
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
          show_filename_only = false,
          path = 1,
        },
        sections = {
          lualine_z = {
            'location',
            {
              'searchcount',
              maxcount = 999,
              timeout = 500,
            },
          },
        },
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    keys = { { "-", "<cmd>lua require('oil').open()<CR>" } },
    opts = {
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
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
    dependencies = { "godlygeek/tabular" },
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
    lazy = true,
    opts = {
      bind = true,
      hint_enable = false,
      floating_window = false,
      toggle_key = "<leader><leader>",
      handler_opts = {
        border = "none",
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
  },
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>" },
      { "<leader>'", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
      { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>" },
      { "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>" },
      { "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>" },
      { "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>" },
      { "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>" },
      { "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<CR>" },
      { "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<CR>" },
      { "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<CR>" },
      { "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<CR>" },
    },
  },
  "ggandor/lightspeed.nvim",
  "tpope/vim-abolish",
  "ggandor/lightspeed.nvim",
  "tpope/vim-abolish",
  "tpope/vim-commentary",
  "tpope/vim-repeat",
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
  },
  {
    "simrat39/symbols-outline.nvim",
    keys = {
      { "<leader>`", "<cmd>SymbolsOutline<CR>" },
    },
    config = function()
      require("symbols-outline").setup({
        autofold_depth = 1,
      })
    end,
  },
  {
    "Wansmer/treesj",
    keys = { { "<leader>j", "<cmd>TSJToggle<CR>", silent = true, noremap = true }, },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
        max_join_length = 320,
      })
    end,
  },
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version=false,
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   opts = {
  --     provider = "claude",
  --     auto_suggestions_provider = "claude",
  --     claude = {
  --       endpoint = "https://api.anthropic.com",
  --       model = "claude-3-5-sonnet-20241022",
  --       temperature = 0,
  --       max_tokens = 4096,
  --     },
  --   }
  -- }
}

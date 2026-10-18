return {
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
            n = {
              ["<C-c>"] = "close",
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
          },
        },
        extensions = {
          live_grep_args = {
            vimgrep_arguments = vim.list_extend(
              vim.deepcopy(require("telescope.config").values.vimgrep_arguments),
              { "--hidden", "--glob", "!.git/*" }
            ),
          },
        },
      })
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
      auto_resize_height = true,
      preview = { show_scroll_bar = false },
    },
    config = function(_, opts)
      require('bqf').setup(opts)
      -- nvim 0.12: H/M/L inside nvim_win_call no longer set the `` mark, causing E20
      local utils = require('bqf.utils')
      local api = vim.api
      utils.zz = function()
        local lnum1, lcount = api.nvim_win_get_cursor(0)[1], api.nvim_buf_line_count(0)
        local zb = 'keepj norm! %dzb'
        if lnum1 == lcount then
          vim.cmd(zb:format(lnum1))
          return
        end
        vim.cmd('norm! zvzz')
        lnum1 = api.nvim_win_get_cursor(0)[1]
        local saved_pos = api.nvim_win_get_cursor(0)
        vim.cmd('norm! L')
        local lnum2 = api.nvim_win_get_cursor(0)[1]
        if lnum2 + vim.fn.getwinvar(0, '&scrolloff') >= lcount then
          vim.cmd(zb:format(lnum2))
        end
        if lnum1 ~= lnum2 then
          api.nvim_win_set_cursor(0, saved_pos)
        end
      end
    end,
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
  {
    url = "https://codeberg.org/andyg/leap.nvim",
    dependencies = { "ggandor/flit.nvim" },
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
      vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
      require("flit").setup()
    end,
  },
  "tpope/vim-abolish",
  "tpope/vim-abolish",
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
    },
    keys = {
      { "]F",         "<cmd>lua require('neotest').jump.next({ status = 'failed' })<CR>", silent = true, noremap = true },
      { "[F",         "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<CR>", silent = true, noremap = true },
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

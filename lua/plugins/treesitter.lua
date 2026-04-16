return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter').setup()

      require("nvim-treesitter").install({
        "bash", "c", "css", "go", "html", "javascript", "json",
        "lua", "luadoc", "luap", "markdown", "markdown_inline",
        "python", "query", "regex", "rust", "svelte", "tsx",
        "typescript", "vim", "vimdoc", "yaml", "perl", "gitignore",
      }):wait(300000)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          -- treesitter.start() is a no-op if no parser is available
          pcall(vim.treesitter.start)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
          },
          include_surrounding_whitespace = false,
        },
        move = {
          set_jumps = true,
        },
      })

      local select = require("nvim-treesitter-textobjects.select")
      vim.keymap.set({ "x", "o" }, "am", function() select.select_textobject("@function.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "im", function() select.select_textobject("@function.inner", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end)
      vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end, { desc = "Select inner part of a class region" })
      vim.keymap.set({ "x", "o" }, "as", function() select.select_textobject("@local.scope", "locals") end, { desc = "Select language scope" })

      -- Swap keymaps
      local swap = require("nvim-treesitter-textobjects.swap")
      vim.keymap.set("n", "<leader>a", function() swap.swap_next("@parameter.inner", "textobjects") end)
      vim.keymap.set("n", "<leader>A", function() swap.swap_previous("@parameter.inner", "textobjects") end)

      -- Move keymaps
      local move = require("nvim-treesitter-textobjects.move")
      vim.keymap.set({ "n", "x", "o" }, "]m",  function() move.goto_next_start("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]]",  function() move.goto_next_start("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "]s",  function() move.goto_next_start("@local.scope", "locals") end)
      vim.keymap.set({ "n", "x", "o" }, "]z",  function() move.goto_next_start("@fold", "folds") end)
      vim.keymap.set({ "n", "x", "o" }, "]M",  function() move.goto_next_end("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "][",  function() move.goto_next_end("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[m",  function() move.goto_previous_start("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[[",  function() move.goto_previous_start("@class.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[z",  function() move.goto_previous_start("@fold", "folds") end)
      vim.keymap.set({ "n", "x", "o" }, "[s",  function() move.goto_previous_start("@local.scope", "locals") end)
      vim.keymap.set({ "n", "x", "o" }, "[M",  function() move.goto_previous_end("@function.outer", "textobjects") end)
      vim.keymap.set({ "n", "x", "o" }, "[]",  function() move.goto_previous_end("@class.outer", "textobjects") end)
    end,
  },
}

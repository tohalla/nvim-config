return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_palette = "gruvbox"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_statusline_style = "mix"
      vim.g.gruvbox_material_current_word = "bold"

      vim.api.nvim_create_augroup("GruvboxMaterialCustom", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = 'GruvboxMaterialCustom',
        callback = function()
          vim.api.nvim_set_hl(0, "IndentGuidesOdd", { bg = "#2B2B2B", fg = "#2B2B2B" })
          vim.api.nvim_set_hl(0, "IndentGuidesEven", { bg = "#1B1D1E", fg = "#1B1D1E" })
          vim.api.nvim_set_hl(0, "Pmenu", { fg = "#EBDBB2", bg = "#000000" })
          vim.api.nvim_set_hl(0, "Visual", { bg = "#665544" })
          vim.api.nvim_set_hl(0, "LightspeedPendingOpArea", { bg = "#665544" })
          vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#EBDBB2", bg = "#000000" })
          vim.api.nvim_set_hl(0, "VirtualTextError", { fg = "#F2594B" })
          vim.api.nvim_set_hl(0, "VirtualTextWarning", { fg = "#E9B143" })
          vim.api.nvim_set_hl(0, "VirtualTextHint", { fg = "gray" })
          vim.api.nvim_set_hl(0, "ErrorFloat", { bg = "#000000" })
          vim.api.nvim_set_hl(0, "InfoFloat", { bg = "#000000" })
          vim.api.nvim_set_hl(0, "HintFloat", { bg = "#000000" })
          vim.api.nvim_set_hl(0, "WarningFloat", { bg = "#000000" })
          vim.api.nvim_set_hl(0, "HighlightedyankRegion", { reverse = true })
        end
      })

      vim.cmd [[ colorscheme gruvbox-material ]]
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "",
      char_highlight_list = { "IndentGuidesOdd", "IndentGuidesEven" },
      space_char_highlight_list = { "IndentGuidesOdd", "IndentGuidesEven" },
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "css",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "html",
        "scss",
      })
    end,
  },
  "kyazdani42/nvim-web-devicons",
  {
    "folke/todo-comments.nvim",
    opts = {
      signs = false,
      highlight = {
        keyword = "fg",
        after = ""
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg" },
        warning = { "DiagnosticWarn", "WarningMsg" },
        info = { "DiagnosticInfo", "orange" },
        hint = { "DiagnosticHint", "comment" },
        default = { "Identifier", "aqua" },
      },
    },
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        delay = 300
      })
    end,
  },
}

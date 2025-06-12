local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "<leader>g'", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.keymap.set("n", "<leader>g;", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>", opts)
  vim.keymap.set("n", "<leader>Q", "<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>", opts)
  vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

  if client.server_capabilities.signatureHelpProvider then
    require("lsp_signature").on_attach({}, bufnr)
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "ray-x/lsp_signature.nvim",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              completion = { callSnippet = "Replace" },
            },
          },
        },
        pyright = {},
        gopls = {},
        jsonls = {},
        golangci_lint_ls = {},
        sqlls = {},
        cssls = {},
        tailwindcss = {
          filetypes = {
            "astro",
            "astro-markdown",
            "ejs",
            "gohtml",
            "gohtmltmpl",
            "html",
            "markdown",
            "mdx",
            "mustache",
            "css",
            "less",
            "postcss",
            "sass",
            "scss",
            "stylus",
            "sugarss",
            "javascriptreact",
            "typescriptreact",
            "vue",
            "svelte",
          }

        },
        svelte = {},
        dockerls = {},
        marksman = {
          filetypes = {
            "markdown",
            "markdown.mdx",
          },
        },
        stylelint_lsp = {},
        rust_analyzer = {},
        eslint = {
          settings = {
            format = false,
            run = "onSave",
          },
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "vue",
            "svelte",
            "astro",
          },
        },
      },
      setup = {
        rust_analyzer = function()
        end,
        ["*"] = function(server, opts)
          require("lspconfig")[server].setup(
            vim.tbl_deep_extend("force", {
              flags = {
                allow_incremental_sync = false,
                debounce_text_changes = 250,
              },
              on_attach = on_attach,
              capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            }, opts or {})
          )
        end,
      },
    },
    config = function(_, opts)
      local function setup(server)
        if opts.setup[server] then
          opts.setup[server](server, opts.servers[server])
          return
        end
        opts.setup["*"](server, opts.servers[server])
      end

      local all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      local ensure_installed = {}
      for server, server_opts in pairs(opts.servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end
      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        automatic_installation = true,
        ensure_installed = ensure_installed,
      })
      mason_lspconfig.setup_handlers({ setup })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    version = false,
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "petertriho/cmp-git",
    },
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      local mapping = {
        ['<C-n>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ['<C-p>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm(),
        ['<CR>'] = cmp.mapping.confirm(),
      }
      cmp.setup({
        enabled = function()
          if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then return false end
          return true
        end,
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = mapping,
        sources = cmp.config.sources(
          { { name = "nvim_lsp" }, { name = "luasnip" } },
          { { name = "buffer" }, { name = "path" } },
          { { name = "lazydev", group_index = 0 } }
        ),
      })
      cmp.setup.filetype({ "gitcommit", "octo" }, {
        mapping = mapping,
        sources = cmp.config.sources {
          { name = "git" },
          { name = "buffer" },
        },
      })
      require("cmp_git").setup()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load()
    end,
    keys = {
      { "<C-]>", "<cmd>lua require'luasnip'.jump(1)<cr>",  mode = { "i", "s" }, silent = true, noremap = true },
      { "<C-[>", "<cmd>lua require'luasnip'.jump(-1)<cr>", mode = { "i", "s" }, silent = true, noremap = true },
    },
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = {
  --     suggestion = {
  --       enabled = false,
  --       auto_trigger = true,
  --       debounce = 75,
  --       keymap = {
  --         accept = "j[",
  --         accept_line = "jj[",
  --         next = "<M-]>",
  --         prev = "<M-[>",
  --       },
  --     },
  --     copilot_node_command = 'node',
  --     filetypes = {
  --       yaml = true,
  --       markdown = true,
  --     },
  --   },
  -- },
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = on_attach,
          default_settings = {
            ["rust-analyzer"] = {},
          },
        },
      }
    end,
  },
  {
    "MunifTanjim/prettier.nvim",
    config = function()
      require("prettier").setup()
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    config = function()
      require("typescript-tools").setup {
        on_attach = on_attach,
      }
    end,
  },
  {
    "sheerun/vim-polyglot",
    lazy = false,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
  },
}

vim.g.maplocalleader = vim.g.mapleader

vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.wrap = true

vim.g.sql_type_default = "pgsql"

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.diffopt:append { "vertical" }
vim.opt.errorbells = false
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars.extends = "›"
vim.opt.listchars.nbsp = "·"
vim.opt.listchars.precedes = "‹"
vim.opt.listchars.tab = " "
vim.opt.listchars.trail = "·"
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.scrolloff = 1
vim.opt.shortmess:append { s = true, I = true }
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.signcolumn = "auto:1-9"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/tmp/undo/"
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.updatetime = 100
vim.opt.visualbell = false
vim.opt.wildignorecase = true
vim.opt.writebackup = false

vim.opt.pumheight = 15

vim.diagnostic.config({
  jump = { float = { scope = "cursor" } },
  virtual_text = { source = true },
  signs = false,
})

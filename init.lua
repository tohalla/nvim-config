vim.g.mapleader = " "

local function load(src)
  local status_ok, fault = pcall(require, src)
  if not status_ok then vim.api.nvim_err_writeln("Failed loading " .. src .. "\n\n" .. fault) end
end

for _, src in ipairs {
  "aucmd",
  "mappings",
  "options",
} do
  load(src)
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

for _, src in ipairs {
  "highlights",
  "snippets",
} do
  load(src)
end

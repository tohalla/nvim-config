-- overrides
vim.keymap.set("i", " ", " ", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<left>", "<nop>", { noremap = true })
vim.keymap.set("i", "<right>", "<nop>", { noremap = true })
vim.keymap.set("i", "<esc>", "<nop>", { noremap = true })

-- navigation
vim.keymap.set("i", "jk", "<esc>", { noremap = true })
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>", { silent = true, noremap = true })
-- buffers, windows, panes, tabs
vim.keymap.set("n", "<C-c>", "<cmd>bp<cr><cmd>bd #<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader><BS>", "<cmd>tabclose<cr>", { silent = true, noremap = true })

-- Keep search results at the center of screen
vim.keymap.set("n", "n", "nzz", { noremap = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true })
vim.keymap.set("n", "*", "*zz", { noremap = true })
vim.keymap.set("n", "#", "#zz", { noremap = true })
vim.keymap.set("n", "g*", "g*zz", { noremap = true })
vim.keymap.set("n", "g#", "g#zz", { noremap = true })

-- yanking
vim.keymap.set("n", "<leader>y", '"*y', { silent = true, noremap = true })
vim.keymap.set("n", "<leader>Y", '"*Y', { silent = true, noremap = true })
vim.keymap.set("n", "<leader>.", '<cmd>let @+ = expand("%:.")<cr>', { silent = true, noremap = true })
vim.keymap.set("n", "Y", "y$", { noremap = true })

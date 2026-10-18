-- overrides
vim.keymap.set("i", " ", " ")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")
vim.keymap.set("i", "<esc>", "<nop>")

-- navigation
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>", { silent = true })
vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>", { silent = true })
-- buffers, windows, panes, tabs
vim.keymap.set("n", "<C-c>", "<cmd>bp<cr><cmd>bd #<cr>", { silent = true })
vim.keymap.set("n", "<leader><BS>", "<cmd>tabclose<cr>", { silent = true })

-- Keep search results at the center of screen
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "g*", "g*zz")
vim.keymap.set("n", "g#", "g#zz")

-- yanking
vim.keymap.set("n", "<leader>y", '"*y', { silent = true })
vim.keymap.set("n", "<leader>Y", '"*Y', { silent = true })
vim.keymap.set("n", "<leader>.", '<cmd>let @+ = expand("%:.")<cr>', { silent = true })
vim.keymap.set("n", "Y", "y$")

vim.api.nvim_create_augroup("check_time", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = "check_time",
  command = "checktime",
})

vim.api.nvim_create_augroup("bw_create_dir", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = "bw_create_dir",
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_augroup("restore_location", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "restore_location",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_augroup("q_close", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "q_close",
  pattern = { "qf", "help", "man", "dap-float" },
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true, nowait = true })
  end,
})

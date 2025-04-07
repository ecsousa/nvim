local path = vim.fn.fnamemodify(vim.fn.expand("$MYVIMRC"), ":h")
local mswin_vim = path .. "/mswin.vim"

vim.cmd("source " .. mswin_vim)
vim.api.nvim_del_keymap("n", "<C-A>")

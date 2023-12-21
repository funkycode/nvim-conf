-- tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- meta key
vim.g.mapleader = " "
-- spell check
vim.cmd("set spell syntax=on")
-- add go to path
vim.opt.path:append("/home/zogg/go/bin")

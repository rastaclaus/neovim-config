--leader keys
local home = os.getenv("HOME")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- vim.g.python3_host_prog = home .. '/.pyenv/versions/neovim3/bin/python'
--настройки копирования
vim.opt.clipboard = "unnamedplus"

--настройки табуляции
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = { tab = "->", trail = "-" }
vim.opt.splitright = true
vim.opt.statuscolumn = ""

--настройки поиска
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.incsearch = true

--настройки форматирования
vim.wo.number = true
vim.wo.wrap = false
vim.opt.textwidth = 120

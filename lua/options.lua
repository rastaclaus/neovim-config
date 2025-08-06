-- leaderkeys:
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ui
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.winborder = "rounded"
vim.opt.cursorcolumn = true
vim.opt.mouse = ""
vim.opt.termguicolors = true

-- indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.incsearch = true

-- behaviour
vim.opt.swapfile = false
vim.opt.undofile = true

-- format
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

-- listoptions
vim.opt.list = true
vim.opt.listchars = { tab = "->", trail = "-" }

-- clipboard
vim.o.clipboard = "unnamedplus"

local function paste()
	return {
		vim.fn.split(vim.fn.getreg(""), "\n"),
		vim.fn.getregtype(""),
	}
end

if vim.env.SSH_TTY then
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = paste,
			["*"] = paste,
		},
	}
end

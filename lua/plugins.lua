vim.pack.add({
	-- Dependencies
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- dependency

	-- https://github.com/ibhagwan/fzf-lua
	{ src = "https://github.com/ibhagwan/fzf-lua" },

	-- Colorschemes
	{ src = "https://github.com/f4z3r/gruvbox-material.nvim" }, -- colorscheme
	{ src = "https://github.com/ribru17/bamboo.nvim"}, -- colorscheme
	{ src = "https://github.com/ellisonleao/gruvbox.nvim"}, -- colorscheme

	-- Oil
	{ src = "https://github.com/stevearc/oil.nvim" }, -- file manager

	-- Helpers
	{ src = "https://github.com/stevearc/conform.nvim" }, -- formatting
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, --syntax parsing
	{ src = "https://github.com/folke/which-key.nvim" }, -- key suggestions
	{ src = "https://github.com/neovim/nvim-lspconfig" }, -- lsp autoconfig

	-- Completion
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" }, -- snippets suggestions

	-- AI
	{ src = "https://github.com/robitx/gp.nvim"}
})

require("plugins.treesitter")
require("plugins.oil")
require("plugins.fzflua")
require("plugins.which_key")
require("plugins.conform")
require("plugins.blink_cmp")
require("plugins.gp")

require("plugins.colorschemes")

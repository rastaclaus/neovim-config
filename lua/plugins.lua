vim.pack.add({
	-- Dependencies
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- dependency
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- dependency
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- dependency

	-- https://github.com/ibhagwan/fzf-lua
	{ src = "https://github.com/ibhagwan/fzf-lua" },

	-- Colorschemes
	{ src = "https://github.com/f4z3r/gruvbox-material.nvim" }, -- colorscheme
	{ src = "https://github.com/catppuccin/nvim" }, -- colorscheme

	-- Oil
	{ src = "https://github.com/stevearc/oil.nvim" }, -- file manager

	-- Helpers
	{ src = "https://github.com/stevearc/conform.nvim" }, -- formatting
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, --syntax parsing
	{ src = "https://github.com/folke/which-key.nvim" }, -- key suggestions
	{ src = "https://github.com/neovim/nvim-lspconfig" }, -- lsp autoconfig

	-- NeoGit
	{ src = "https://github.com/sindrets/diffview.nvim" }, -- for Diff integration
	{ src = "https://github.com/NeogitOrg/neogit" }, -- NeoGit tools

	-- Completion
	{ src = "http://github.com/saghen/blink.cmp", version = vim.version.range("1") },
	{ src = "http://github.com/rafamadriz/friendly-snippets" }, -- snippets suggestions

	-- AI helpers
	{
		src = "https://github.com/Kurama622/llm.nvim",
		cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" }, --llm tools
	},
})

require("plugins.treesitter")
require("neogit").setup({})
require("plugins.oil")
require("plugins.fzflua")
require("plugins.which_key")
require("plugins.conform")
require("plugins.blink_cmp")
require("plugins.llm")

require("plugins.colorschemes")

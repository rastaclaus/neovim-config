vim.pack.add({
	-- dependencies
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- dependency
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- dependency
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- dependency
	-- https://github.com/ibhagwan/fzf-lua
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	-- colorschemes
	{ src = "https://github.com/f4z3r/gruvbox-material.nvim" }, -- colorscheme
	{ src = "https://github.com/stevearc/oil.nvim" }, -- file manager
	{ src = "https://github.com/stevearc/conform.nvim" },  -- formatting
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, --syntax parsing
	{ src = "https://github.com/folke/which-key.nvim" }, -- key suggestions
	{ src = "https://github.com/neovim/nvim-lspconfig" }, -- lsp autoconfig
	-- AI helpers
	{
		src = "https://github.com/Kurama622/llm.nvim",
		cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" }, --llm tools
	},
})

require("plugins.treesitter")
require("plugins.oil")
require("plugins.fzflua")
require("plugins.which_key")
require("plugins.conform")
require("plugins.llm")
require("plugins.gruvbox")

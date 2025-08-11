vim.pack.add({
	-- colorschemes
	{ src = "https://github.com/f4z3r/gruvbox-material.nvim" }, -- colorscheme
	{ src = "https://github.com/stevearc/oil.nvim" }, -- file manager
	{ src = "https://github.com/stevearc/conform.nvim" },  -- formatting
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, --syntax parsing
	{ src = "https://github.com/folke/which-key.nvim" }, -- key suggestions
	{ src = "https://github.com/neovim/nvim-lspconfig" }, -- lsp autoconfig
	-- AI helpers
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- dependency of llm
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- dependency of llm
	{
		src = "https://github.com/Kurama622/llm.nvim",
		cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" }, --llm tools
	},
})

require("plugins.treesitter")
require("plugins.oil")
require("plugins.which_key")
require("plugins.conform")
require("plugins.llm")
require("plugins.gruvbox")

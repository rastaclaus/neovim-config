vim.pack.add({
	{ src = "https://github.com/f4z3r/gruvbox-material.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/benomahony/oil-git.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1"),
	},
	{ src = "https://github.com/ibhagwan/fzf-lua" },

	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{
		src = "https://github.com/Kurama622/llm.nvim",
		cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
	},
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

require("plugins.treesitter_setup")
require("plugins.conform_setup")
require("plugins.blink_cmp_setup")
require("fzf-lua").setup()
require("plugins.oil_setup")
require("supermaven-nvim").setup({})
require("plugins.llm_setup")
require("which-key").setup()
require("gruvbox-material").setup({
	dark = true,
	contrast = "hard",
	background = { transparent = true },
})

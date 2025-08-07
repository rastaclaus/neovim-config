vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/f4z3r/gruvbox-material.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- neotree dependencies
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	 {
	 	src = "https://github.com/saghen/blink.cmp",
	 	version = vim.version.range("1")
	 },
	 { src = "https://github.com/rcarriga/nvim-notify"},
	 { src = "https://github.com/supermaven-inc/supermaven-nvim"},
	 {
		 src = "https://github.com/Kurama622/llm.nvim",
		 cmd = {"LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler"},
	 },
	 { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("mason").setup()
require("fzf-lua").setup()
require("which-key").setup()
require("plugins.conform_setup")
require("vague").setup({ transparent = true })
require("gruvbox-material").setup({
	dark = true,
	contrast = "hard",
	background = {transparent = true},
})
require("plugins.blink_cmp_setup")
require("plugins.treesitter_setup")
require("supermaven-nvim").setup({})
require("plugins.llm_setup")

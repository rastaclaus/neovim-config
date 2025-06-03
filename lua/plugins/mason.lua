return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local lspconfig = require("lspconfig")
		require("mason").setup({})
		require("mason-lspconfig").setup({
			automatic_enable = {
				exclude = {
					"ruff",
					-- "basedpyright",
				},
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				-- "basedpyright",
				"ruff",
				"json-lsp",
				"jq",
				"yaml-language-server",
				"yamlfix",
                "ty",
			},
		})

		-- lspconfig.basedpyright.setup({
		-- 	single_file_support = true,
		-- })

		lspconfig.ruff.setup({
			init_options = {
				settings = {
					configuration = os.getenv("HOME") .. ".ruff.toml",
					configurationPreference = "filesystemFirst",
				},
			},
		})
	end,
}

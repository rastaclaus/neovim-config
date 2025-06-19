return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local lspconfig = require("lspconfig")
		require("mason").setup()
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
                "gopls",
			},
		})

		-- lspconfig.basedpyright.setup({
		-- 	settings = {
		-- 		basedpyright = {
		-- 			analysis = {
		-- 				typeCheckingMode = "strict",
		-- 				-- ignore = { "*" },
		-- 			},
		-- 		},
		-- 	},
		-- })

		lspconfig.ruff.setup({
			init_options = {
				settings = {
					configuration = os.getenv("HOME") .. "/.ruff.toml",
					configurationPreference = "filesystemFirst",
				},
			},
		})
        lspconfig.gopls.setup({
            root_dir = lspconfig.util.root_pattern("go.mod", ".git")
        })
	end,
}

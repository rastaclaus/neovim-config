return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({})
        require('mason-tool-installer').setup ({
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "basedpyright",
                "ruff",
                "json-lsp",
                "jq",
                "yaml-language-server",
                "yamlfix"
            }
        })
		require("mason-lspconfig").setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({
					on_attach = on_attach_handler,
					flags = {
						debounce_text_changes = 150,
					},
				})
			end,
			-- Next, you can provide a dedicated handler for specific servers.
			["basedpyright"] = function()
				local lspconfig = require("lspconfig")

				lspconfig["basedpyright"].setup({
					on_attach = on_attach_handler,
					single_file_support = true,
					settings = {
						basedpyright = {
							analysis = {
								-- ignore = {'*'},
							},
						},
					},
				})
			end,
			["ruff"] = function()
				local lspconfig = require("lspconfig")

				lspconfig["ruff"].setup({
					init_options = {
						settings = {
							configuration = os.getenv("HOME") .. ".ruff.toml",
							configurationPreference = "filesystemFirst",
						},
					},
				})
			end,
		})
	end,
}

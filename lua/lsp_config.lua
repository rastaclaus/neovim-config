-- Better LSP UI
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✗",
			[vim.diagnostic.severity.WARN] = "⚠",
			[vim.diagnostic.severity.INFO] = "ℹ",
			[vim.diagnostic.severity.HINT] = "💡",
		}
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		source = true,
	}
})

vim.lsp.enable({ "lua_ls", "basedpyright", "ruff", "gopls", "jsonls", "yamlls", "dockerls" })

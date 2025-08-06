require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "jq" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		lua = { "stylua" },
		python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
		go = { "gofmt" },
		toml = { "pyproject-fmt" },
	},
	format_on_save = nil,
	formatters = {
		ruff_format = {
			prepend_args = { "--config", "~/.ruff.toml" },
		},
		ruff_fix = {
			prepend_args = { "--config", "~/.ruff.toml" },
		},
		ruff_organize_imports = {
			prepend_args = { "--config", "~/.ruff.toml" },
		},
	},
})

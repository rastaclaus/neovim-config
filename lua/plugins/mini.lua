return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		local diff = require("mini.diff")
		diff.setup({ source = diff.gen_source.none() })
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.snippets").setup()
	end,
}

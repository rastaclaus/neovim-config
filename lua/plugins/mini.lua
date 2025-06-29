return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.diff").setup({ source = require("mini.diff").gen_source.none() })
        require("mini.icons").setup()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.snippets").setup()
		-- require("mini.pick").setup()
        -- require("mini.completion").setup({ lsp_completion = {source_func = "completefunc"}})
	end,
}

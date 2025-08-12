local detail
require("oil").setup({
	keymaps = {
		["gd"] = {
			desc = "Toggle file detail view",
			callback = function()
				detail = not detail
				if detail then
					require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
				else
					require("oil").set_columns({ "icon" })
				end
			end,
		},
	},
	win_options = {
		signcolumn = "yes:2",
	},
})
require("oil-git-status").setup({
	show_ignored=true
})

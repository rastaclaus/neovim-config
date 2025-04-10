return {
	"olimorris/codecompanion.nvim",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		display = {
			diff = {
				enabled = true,
				close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
				layout = "vertical", -- vertical|horizontal split for default provider
				opts = {
					"internal",
					"filler",
					"closeoff",
					"algorithm:histogram",
					"indent-heuristic",
					"followwrap",
					"linematch:120",
				},
				provider = "mini_diff", -- default|mini_diff
			},
		},
		adapters = {
			opts = {
				show_defaults = false,
			},
			["bothub"] = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "bothub",
					formatted_name = "BotHub",
					env = {
						url = "https://bothub.chat/api/v2/openai",
						chat_url = "/v1/chat/completions",
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "claude-3.7-sonnet", -- define llm model to be used
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "bothub",
				tools = {
					["mcp"] = {
						callback = function()
							return require("mcphub.extensions.codecompanion")
						end,
						opts = {
							required_approval = true,
							temperature = 0.2,
						},
						description = "Call tools and resources from the MCP Servers",
					},
				},
			},
			inline = {
				adapter = "bothub",
			},
		},
	},
}

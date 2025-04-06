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
				opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
				provider = "mini_diff", -- default|mini_diff
			},
		},
		adapters = {
			opts = {
				show_defaults = false,
			},
			qwen = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "qwen",
					env = {
						url = "https://bothub.chat/api/v2/openai",
						chat_url = "/v1/chat/completions",
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "qwen-2.5-coder-32b-instruct", -- define llm model to be used
							choices = { "qwen-2.5-coder-32b-instruct", "qwen-2.5-72b-instruct" }, -- define llm model to be used
						},
					},
				})
			end,
			claude = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "claude",
					env = {
						url = "https://bothub.chat/api/v2/openai",
						chat_url = "/v1/chat/completions",
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "claude-3.5-haiku", -- define llm model to be used
							choices = { "claude-3.5-haiku", "claude-3.5-sonnet", "claude-3.7-sonnet" }, -- define llm model to be used
						},
					},
				})
			end,
			gemini = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "gemini",
					env = {
						url = "https://bothub.chat/api/v2/openai",
						chat_url = "/v1/chat/completions",
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "gemini-2.0-flash-001", -- define llm model to be used
							choices = {
								"gemini-2.0-flash-001",
								"gemini-2.5-pro-exp-03-25:free",
							},
						},
					},
				})
			end,
			deepseek = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "deepseek",
					env = {
						url = "https://bothub.chat/api/v2/openai",
						chat_url = "/v1/chat/completions",
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "deepseek-chat", -- define llm model to be used
							choices = { "deepseek-chat", "deepseek-r1" }, -- define llm model to be used
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "claude",
				slash_commands = {
					["file"] = {
						callback = "strategies.chat.slash_commands.file",
						opts = {
							provider = snacks,
							contains_code = true,
						},
					},
					["buffer"] = {
						callback = "strategies.chat.slash_commands.buffer",
						opts = {
							provider = snacks,
							contains_code = true,
						},
					},
				},
			},
			inline = {
				adapter = "gemini",
			},
			cmd = {
				adapter = "gemini",
			},
			agent = {
				adapter = "gemini",
			},
		},
	},
}

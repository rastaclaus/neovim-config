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
					formatted_name = "BotHubQwen",
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
					formatted_name = "BotHubClaude",
					env = {
						url = "https://bothub.chat/api/v2/openai",
						chat_url = "/v1/chat/completions",
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "claude-3.5-haiku", -- define llm model to be used
							choices = {
								"claude-3.5-haiku",
								"claude-3.5-sonnet",
								"claude-3.7-sonnet",
								"claude-3.7-sonnet:thinking",
							}, -- define llm model to be used
						},
					},
				})
			end,
			gemini = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "gemini",
					formatted_name = "BotHubGemini",
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
								"gemini-2.5-pro-preview-03-25",
							},
						},
					},
				})
			end,
			deepseek = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "deepseek",
					formatted_name = "BotHubDeepseek",
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
			llama = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "deepseek",
					formatted_name = "BotHubDeepseek",
					env = {
						url = "https://bothub.chat/api/v2/openai",
						chat_url = "/v1/chat/completions",
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "llama-4-maverick", -- define llm model to be used
							choices = { "llama-4-maverick", "llama-3.1-70b-instruct", "llama-3.1-450b-instruct" }, -- define llm model to be used
						},
					},
				})
			end,
			["ntech/qwen2.5-coder-32b-instruct"] = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "ntech/qwen2.5-coder-32b-instruct",
					formatted_name = "ntech/qwen2.5-coder-32b-instruct",
					env = {
						url = "https://llm-code.ntechlab.ru:36502",
						chat_url = "/v1/chat/completions",
						api_key = "cmd: cat ~/.config/ntech_key",
					},
					schema = {
						model = {
							default = "qwen/qwen2.5-coder-32b-instruct", -- define llm model to be used
							choices = { "qwen/qwen2.5-coder-32b-instruct" }, -- define llm model to be used
						},
					},
				})
			end,
			["ntech/qwen-2.5-72b-instruct"] = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "ntech/qwen-2.5-72b-instruct",
					formatted_name = "ntech/qwen2.5-72b-instruct",
					env = {
						url = "https://llm-common.ntechlab.ru:36507",
						chat_url = "/v1/chat/completions",
						api_key = "cmd: cat ~/.config/ntech_key",
					},
					schema = {
						model = {
							default = "qwen/qwen2.5-72b-instruct", -- define llm model to be used
							choices = { "qwen/qwen2.5-72b-instruct" }, -- define llm model to be used
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				tools = {
					["mcp"] = {
						callback = function()
							return require("mcphub.extensions.codecompanion")
						end,
						opts = {
							required_approval = true,
							temperature = 0.7,
						},
						description = "Call tools and resources from the MCP Servers",
					},
				},
				adapter = "claude",
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

return {
	"olimorris/codecompanion.nvim",
    config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			opts = {
				show_defaults = false,
			},
			qwen = function()
				return require("codecompanion.adapters").extend("openai", {
					name = "qwen",
                    url = "https://bothub.chat/api/v2/openai/v1/chat/completions", -- optional: default value is ollama url http://127.0.0.1:11434
					env = {
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "qwen-2.5-coder-32b-instruct", -- define llm model to be used
							choices = {"qwen-2.5-coder-32b-instruct", "qwen-2.5-72b-instruct"}, -- define llm model to be used
						},
					},
				})
			end,
			claude = function()
				return require("codecompanion.adapters").extend("openai", {
					name = "claude",
                    url = "https://bothub.chat/api/v2/openai/v1/chat/completions", -- optional: default value is ollama url http://127.0.0.1:11434
					env = {
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "claude-3.5-haiku", -- define llm model to be used
							choices = {"claude-3.5-haiku", "claude-3.5-sonnet", "claude-3.7-sonnet"}, -- define llm model to be used
						},
					},
				})
			end,
			gemini = function()
				return require("codecompanion.adapters").extend("openai", {
					name = "gemini",
                    url = "https://bothub.chat/api/v2/openai/v1/chat/completions", -- optional: default value is ollama url http://127.0.0.1:11434
					env = {
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
				return require("codecompanion.adapters").extend("openai", {
					name = "deepseek",
                    url = "https://bothub.chat/api/v2/openai/v1/chat/completions", -- optional: default value is ollama url http://127.0.0.1:11434
					env = {
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "deepseek-chat", -- define llm model to be used
							choices = {"deepseek-chat", "deepseek-r1"}, -- define llm model to be used
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "claude",
			},
			inline = {
				adapter = "gemini",
			},
			cmd = {
				adapter = "gemini",
			},
		},
	},
}

return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			opts = {
				show_defaults = false,
			},
			claude_35_haiku = function()
				return require("codecompanion.adapters").extend("openai", {
					name = "claude_35_haiku",
                    url = "https://bothub.chat/api/v2/openai/v1/chat/completions", -- optional: default value is ollama url http://127.0.0.1:11434
					env = {
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "claude-3.5-haiku", -- define llm model to be used
							choices = {"claude-3.5-haiku", }, -- define llm model to be used
						},
					},
				})
			end,
			gemini_20_flash = function()
				return require("codecompanion.adapters").extend("openai", {
					name = "gemini_20_flash",
                    url = "https://bothub.chat/api/v2/openai/v1/chat/completions", -- optional: default value is ollama url http://127.0.0.1:11434
					env = {
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "gemini-2.0-flash-001", -- define llm model to be used
							choices = {"gemini-2.0-flash-001"}, -- define llm model to be used
						},
					},
				})
			end,
			deepseek_chat = function()
				return require("codecompanion.adapters").extend("openai", {
					name = "deepseek_chat",
                    url = "https://bothub.chat/api/v2/openai/v1/chat/completions", -- optional: default value is ollama url http://127.0.0.1:11434
					env = {
						api_key = "cmd: cat ~/.config/openai_key",
					},
					schema = {
						model = {
							default = "deepseek-chat", -- define llm model to be used
							choices = {"deepseek-chat", }, -- define llm model to be used
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "claude_35_haiku",
			},
			inline = {
				adapter = "gemini_20_flash",
			},
			cmd = {
				adapter = "deepseek_chat",
			},
		},
	},
}

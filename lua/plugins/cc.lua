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
				show_model_choices = true,
			},
			["bothub"] = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "bothub",
					formatted_name = "BotHub",
					env = {
						url = "https://bothub.chat/api/v2/openai",
						api_key = "cmd: cat ~/.config/openai_key",
						chat_url = "/v1/chat/completions",
						models_endpoint = "/v1/models",
					},
					schema = {
						model = {
							default = "gpt-4.1-mini", -- define llm model to be used
						},
					},
				})
			end,
			["ntech"] = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "ntech",
					formatted_name = "NTech",
					env = {
						url = "http://p2.msk-1.hpc-park.ru:36503",
						api_key = "cmd: cat ~/.config/ntech_key",
						chat_url = "/v1/chat/completions",
					},
					schema = {
						model = {
							default = "Qwen/Qwen3-32B", -- define llm model to be used
						},
					},
				})
			end,
		},
		strategies = {
			chat = {
				adapter = "bothub",
			},
			inline = {
				adapter = "bothub",
			},
		},
		opts = {
			log_level = "INFO",
		},
	},
}

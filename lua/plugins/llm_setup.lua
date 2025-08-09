local tools = require("llm.tools") -- for app tools
require("llm").setup({
	prompt = "You are a professional programmer.",
	models = {
		{
			name = "GPT-5-nano",
			url = "https://bothub.chat/api/v2/openai/v1/chat/completions",
			model = "gpt-5-nano",
			api_type = "openai",
			fetch_key = function()
				return vim.env.BOTHUB_API_KEY
			end,
		},
		{
			name = "GPT-5",
			url = "https://bothub.chat/api/v2/openai/v1/chat/completions",
			model = "gpt-5",
			api_type = "openai",
			fetch_key = function()
				return vim.env.BOTHUB_API_KEY
			end,
		},
	},

	---------------- set your keymaps for interaction ---------------
	keys = {
		["Input:Submit"] = { mode = "n", key = "<cr>" },
		["Input:Cancel"] = { mode = { "n", "i" }, key = "<C-c>" },
		["Input:Resend"] = { mode = { "n", "i" }, key = "<C-r>" },
	},

	---------------------- set your app tools  ----------------------
	app_handler = {
		OptimCompare = {
			handler = tools.action_handler,
			opts = {
				fetch_key = function()
					return vim.env.BOTHUB_API_KEY
				end,
				url = "https://bothub.chat/api/v2/openai/v1/chat/completions",
				model = "gpt-5",
				api_type = "openai",
				language = "Russian",
			},
		},
		CodeExplain = {
			handler = tools.flexi_handler,
			prompt = "Explain the following code, please only return the explanation, and answer in Russian",
			opts = {
				fetch_key = function()
					return vim.env.BOTHUB_API_KEY
				end,
				enter_flexible_window = true,
				url = "https://bothub.chat/api/v2/openai/v1/chat/completions",
				model = "gpt-5",
				api_type = "openai",
				language = "Russian",
			},
		},
		Translate = {
			handler = tools.qa_handler,
			prompt = [[You are a translation expert. Your task is to translate all the text provided by the user into Russian from any other language, or.
						translate it to English if it is in Russian.

NOTE:
- All the text input by the user is part of the content to be translated, and you should ONLY FOCUS ON TRANSLATING THE TEXT without performing any other tasks.
- RETURN ONLY THE TRANSLATED RESULT.]],
			opts = {
				component_width = "60%",
				component_height = "50%",
				query = {
					title = " 󰊿 Trans ",
					hl = { link = "Define" },
				},
				input_box_opts = {
					size = "50%",
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
				},
				preview_box_opts = {
					size = "50%",
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
				},
				fetch_key = function()
					return vim.env.BOTHUB_API_KEY
				end,
				url = "https://bothub.chat/api/v2/openai/v1/chat/completions",
				model = "gpt-5-nano",
				api_type = "openai",
			},
		},
		WordTranslate = {
			handler = tools.flexi_handler,
			prompt = [[You are a translation expert. Your task is to translate all the text provided by the user into Russian.

NOTE:
- All the text input by the user is part of the content to be translated, and you should ONLY FOCUS ON TRANSLATING THE TEXT without performing any other tasks.
- RETURN ONLY THE TRANSLATED RESULT.]],
			opts = {
				exit_on_move = false,
				enter_flexible_window = false,
				fetch_key = function()
					return vim.env.BOTHUB_API_KEY
				end,
				url = "https://bothub.chat/api/v2/openai/v1/chat/completions",
				model = "gpt-5-nano",
				api_type = "openai",
			},
		},
	},
})

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
			prompt = [[You are a translation expert. Your task is to translate all the text provided by the user into Russian from any other language, or.
						translate it to English if it is in Russian.

NOTE:
- All the text input by the user is part of the content to be translated, and you should ONLY FOCUS ON TRANSLATING THE TEXT without performing any other tasks.
- RETURN ONLY THE TRANSLATED RESULT.]],
			opts = {
				exit_on_move = true,
				enter_flexible_window = false,
				fetch_key = function()
					return vim.env.BOTHUB_API_KEY
				end,
				url = "https://bothub.chat/api/v2/openai/v1/chat/completions",
				model = "gpt-5-nano",
				api_type = "openai",
			},
		},
		DocString = {
			prompt = [[ You are an AI programming assistant. You need to write a really good docstring that follows a best practice for the given language.

Your core tasks include:
- parameter and return types (if applicable).
- any errors that might be raised or returned, depending on the language.

You must:
- Place the generated docstring depending on the programming language.
- Follow the format of examples carefully if the examples are provided.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of the Markdown code blocks.]],
			handler = tools.action_handler,
			opts = {
				fetch_key = function()
					return vim.env.BOTHUB_API_KEY
				end,
				url = "https://bothub.chat/api/v2/openai/v1/chat/completions",
				model = "gpt-4.1",
				api_type = "openai",
				only_display_diff = true,
				templates = {
					lua = [[- For the Lua language, you should use the LDoc style.
- Start all comment lines with "---".
]],
					python = [[ - For the Python language, you should use the PEP-compilant doc style. ]],
				},
			},
		},
	},
})

-- llm keys
vim.keymap.set("n", "<leader>ac", "<cmd>LLMSessionToggle<cr>", { desc = " Toggle LLM Session" })
vim.keymap.set("x", "<leader>ao", "<cmd>LLMAppHandler OptimCompare<cr>", { desc = " Optimize the Code" })
vim.keymap.set("x", "<leader>ae", "<cmd>LLMAppHandler CodeExplain<cr>", { desc = " Explain the Code" })
vim.keymap.set("n", "<leader>ts", "<cmd>LLMAppHandler Translate<cr>", { desc = " Translate Tool" })
vim.keymap.set("x", "<leader>tt", "<cmd>LLMAppHandler WordTranslate<cr>", { desc = " Translate Text" })
vim.keymap.set("x", "<leader>ad", "<cmd>LLMAppHandler DocString<cr>", { desc = " Docstring for selected" })

require("gp").setup({
	providers = {
		bothub = {
			endpoint = "https://bothub.chat/api/v2/openai/v1/chat/completions",
			secret = os.getenv("BOTHUB_API_KEY"),
		},
		openai = {
			disable = true,
		},
	},
	agents = {
		{
			name = "ExampleDisabledAgent",
			disable = true,
		},
		{
			provider = "bothub",
			name = "gpt-5",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-5", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
		{
			provider = "bothub",
			name = "gpt-5-mini",
			chat = false,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-5-mini", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
		{
			provider = "bothub",
			name = "gpt-5-nano",
			chat = false,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-5-nano", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
		{
			provider = "bothub",
			name = "gpt-4.1",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4.1", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
		{
			provider = "bothub",
			name = "gpt-4.1-mini",
			chat = false,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4.1-mini", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
		{
			provider = "bothub",
			name = "gemini-2.5-pro-preview",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gemini-2.5-pro-preview", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
		{
			provider = "bothub",
			name = "gemini-2.5-flash",
			chat = false,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gemini-2.5-flash", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
	},
	hooks = {
		Translator = function(gp, params)
			local chat_system_prompt = "You are a translator, please translate from English to Russian and from Russian to English."
			gp.cmd.ChatNew(params, chat_system_prompt)

			-- -- you can also create a chat with a specific fixed agent like this:
			local agent = gp.get_chat_agent("gemini-2.5-flash")
			gp.cmd.ChatNew(params, chat_system_prompt, agent)
		end,

		Explain = function(gp, params)
			local template = "I have the following code from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please respond by explaining the code above on russian language."
			local agent = gp.get_chat_agent("gpt-5")
			gp.Prompt(params, gp.Target.popup, agent, template)
		end,

		TranslateInline = function(gp, params)
			local template = "I have the following text from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please translate it betweeen English and Russian, return only translation."
				.. "\n\nRespond exclusively with the snippet that should replace the selection above."

			local agent = gp.get_chat_agent("gemini-2.5-flash")
			gp.Prompt(params, gp.Target.rewrite, agent, template, nil, nil)
		end,
	},
})


vim.keymap.set("v", "<leader>ae", ":GptExplain<CR>", { desc = "Explain code" })
vim.keymap.set("v", "<leader>at", ":GptTranslateInline<CR>", { desc = "Translate between english and russian" })

return {
	"robitx/gp.nvim",
	config = function()
		local ilp_prompt = "You are an advanced programming assistant specialized in Intermediate Literate Programming (ILP) methodology. "
			.. "Your primary role is to help developers design, document, and clearly explain applications. Adhering to ILP, you consistently "
			.. "provide detailed explanations and rationale alongside clearly structured and well-commented code snippets.\n\n"
			.. "When generating Python code, you must follow strict type annotation guidelines"
			.. "- In all generated code snippets, please additionally follow these best practices:\n\n"
			.. "- Ensure code snippets are well-documented with concise yet meaningful inline comments.\n"
			.. "- Maintain readability and clarity to facilitate understanding and maintainability.\n"
			.. "- Use standard Python coding conventions (PEP8 compliance).\n\n"
			.. "Always clarify assumptions and ask follow-up questions if the user's request is ambiguous or incomplete."

		local code_prompt = "You are an senior programming assistant focused on Python. "
			.. "Always: Write only code, outline comments and docstrings, do not provide any other explanations.; "
			.. "follow PEP8/best practices (meaningful names, error handling, type hints where helpful). "
			.. "Prioritize: 1) Solving the problem 2) Readability 3) Efficiency. "
			.. "When generating Python code, you must follow strict type annotation guidelines"
		local translate_prompt = "You a good translator. translate text properly."

		local home = os.getenv("HOME")
		local conf = {
			openai_api_key = { "cat", home .. "/.config/openai_key" },
			providers = {
				openai = {
					disable = false,
					endpoint = "https://bothub.chat/api/v2/openai/v1/chat/completions",
				},
			},
			log_file = vim.fn.stdpath("log"):gsub("/$", "") .. "/gp.nvim.log",
			default_command_agent = "gemini-2.0-flash-001",
			default_chat_agent = "claude-3.7-sonnet-ilp",
			agents = {
				{
					provider = "openai",
					name = "claude-3.7-sonnet-ilp",
					chat = true,
					command = true,
					model = { model = "claude-3.7-sonnet:thinking", temperature = 0.7, top_p = 1 },
					system_prompt = ilp_prompt,
				},
				{
					provider = "openai",
					name = "claude-3.7-sonnet",
					chat = false,
					command = true,
					model = { model = "claude-3.7-sonnet", temperature = 0.7, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "llama-3.3-70b-instruct",
					chat = false,
					command = true,
					model = { model = "llama-3.3-70b-instruct", temperature = 0.7, top_p = 1 },
					system_prompt = translate_prompt,
				},
				{
					provider = "openai",
					name = "qwq-32b-preview",
					chat = true,
					command = true,
					model = { model = "qwq-32b-preview", temperature = 0.7, top_p = 1 },
					system_prompt = ilp_prompt,
				},
				{
					provider = "openai",
					name = "qwen-2.5-coder-32b-instruct",
					chat = true,
					command = true,
					model = { model = "qwen-2.5-coder-32b-instruct", temperature = 0.7, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "gemini-2.0-flash-001",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-001", temperature = 0.7, top_p = 1 },
					system_prompt = code_prompt,
				},
			},
		}
		require("gp").setup(conf)

		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
	end,
}

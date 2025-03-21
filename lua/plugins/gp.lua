return {
	"robitx/gp.nvim",
	config = function()
		local document_prompt = "Task: Create structured, clear, and comprehensive documentation for an application development. "
			.. "Documentation format - markdown"
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
			default_chat_agent = "deepseek-r1",
			agents = {
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
				{
					provider = "openai",
					name = "gemini-2.0-flash-001-writer",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-001", temperature = 0.7, top_p = 1 },
					system_prompt = document_prompt,
				},
				{
					provider = "openai",
					name = "claude-3.7-sonnet-writer",
					chat = true,
					command = true,
					model = { model = "claude-3.7-sonnet", temperature = 0.7, top_p = 1 },
					system_prompt = document_prompt,
				},
				{
					provider = "openai",
					name = "gemini-2.0-flash-001-translator",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-001", temperature = 0.7, top_p = 1 },
					system_prompt = translate_prompt,
				},
			},
		}
		require("gp").setup(conf)
		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
	end,
}

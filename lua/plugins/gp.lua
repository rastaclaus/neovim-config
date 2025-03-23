return {
	"robitx/gp.nvim",
	config = function()
		local document_prompt = "Task: Create structured, clear, and comprehensive documentation for an application development. "
			.. "Documentation format - markdown "
            .. "When writing python code: "
			.. "Use Python 3.10+ type annotation syntax exclusively "
			.. "Avoid legacy typing module constructs where newer alternatives exist: "
			.. "  Prefer X | Y over Union[X, Y] "
			.. "  Prefer X | None over Optional[X]"
			.. "  Use built-in generics (list, dict, etc.) instead of List, Dict "
			.. "  Use explicit TypeAlias declarations for complex type definitions "
			.. "  Leverage PEP 604/612/613 features for unions, parameters, and type variables "
		local code_prompt = "You are an senior programming assistant focused on Python. "
			.. "Always: Write only code, outline comments and docstrings, do not provide any other explanations.; "
			.. "follow PEP8/best practices (meaningful names, error handling, type hints where helpful). "
			.. "Prioritize: 1) Solving the problem 2) Readability 3) Efficiency. "
			.. "Use Python 3.10+ type annotation syntax exclusively "
			.. "Avoid legacy typing module constructs where newer alternatives exist: "
			.. "  Prefer X | Y over Union[X, Y] "
			.. "  Prefer X | None over Optional[X]"
			.. "  Use built-in generics (list, dict, etc.) instead of List, Dict "
			.. "  Use explicit TypeAlias declarations for complex type definitions "
			.. "  Leverage PEP 604/612/613 features for unions, parameters, and type variables "

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
			default_command_agent = "gemini-2.0-flash-001-coder",
			default_chat_agent = "deepseek-r1-coder",
			agents = {
				{
					provider = "openai",
					name = "gemini-2.0-flash-001-coder",
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
					name = "gemini-2.0-flash-001-translator",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-001", temperature = 0.7, top_p = 1 },
					system_prompt = translate_prompt,
				},
				{
					provider = "openai",
					name = "gemini-2.0-flash-thinking-exp:free-coder",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-thinking-exp:free", temperature = 0.7, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "gemini-2.0-flash-thinking-exp:free-writer",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-thinking-exp:free", temperature = 0.7, top_p = 1 },
					system_prompt = document_prompt,
				},
				{
					provider = "openai",
					name = "deepseek-r1-coder",
					chat = true,
					command = true,
					model = { model = "deepseek-r1", temperature = 0.7, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "deepseek-r1-writer",
					chat = true,
					command = true,
					model = { model = "deepseek-r1", temperature = 0.7, top_p = 1 },
					system_prompt = document_prompt,
				},
				{
					provider = "openai",
					name = "grok-beta-coder",
					chat = true,
					command = true,
					model = { model = "grok-beta", temperature = 0.7, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "grok-beta-writer",
					chat = true,
					command = true,
					model = { model = "grok-beta", temperature = 0.7, top_p = 1 },
					system_prompt = document_prompt,
				},
			},
		}
		require("gp").setup(conf)
		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
	end,
}

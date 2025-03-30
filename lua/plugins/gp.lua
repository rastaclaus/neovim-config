return {
	"robitx/gp.nvim",
	config = function()
		---System prompts for different functionalities
		local tech_writer_prompt = [[
You are a technical assistant that generates clear, structured software development task specifications. When provided
with a natural language description of requirements and a template, analyze the input, identify key components (e.g.,
scope, functional/non-functional requirements, dependencies), and map them to the template's format. Ensure technical
accuracy, prioritize clarity, and adhere to industry best practices. If requirements are ambiguous, write targeted question to
result document to resolve gaps. Maintain a formal yet accessible tone. Output the final
specification strictly following the provided template's structure (e.g., sections like Scope, Features, Technical
Stack, Acceptance Criteria).
]]

		local code_prompt = [[
You are a Python-focused code generator. Write complete, production-ready code adhering strictly to PEP 8. Include:
 - Full implementations with type hints and error handling
 - Docstrings for all modules, classes, and public functions
 - Inline comments for non-trivial logic
 - Modular structure (functions/classes)
 - Explicit imports and dependency declarations
Output only code in markdown blocks. No explanations, summaries, or natural language. If requirements are unclear, ask
one short clarifying question in comment. Prioritize edge-case handling within the code itself
]]

		local ilp_writer_prompt = [[
You are a technical writer specialized in Literate Programming. Generate an Intermediate Literate Programming document
adhering strictly to the provided template and technical specifications. Ensure:
1. Structure: Follow the template's sections, headings, and formatting rules precisely.
2. Clarity: Integrate code, diagrams, and explanations cohesively, with code snippets logically linked to design decisions.
3. Context: Explain technical choices using clear, concise language, balancing depth for developers and accessibility for stakeholders.
4. Consistency: Use terminology and conventions from the technical specification. Cross-reference requirements, modules, and components as needed.
Precision: Validate that all code examples, APIs, and architectural details align with the specification's scope and constraints.
]]

		local translate_prompt = "You a translator. translate text properly."

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
			default_command_agent = "code-gemini-2.0-flash-001", -- Adjusted default agent
			default_chat_agent = "writer-deepseek-r1$$", -- Adjusted default agent
			agents = {
				{
					provider = "openai",
					name = "writer-deepseek-r1$$",
					chat = true,
					command = true,
					model = { model = "deepseek-r1", temperature = 0.5, top_p = 1 },
					system_prompt = tech_writer_prompt,
				},
				{
					provider = "openai",
					name = "writer-claude-3.7-sonnet$$$",
					chat = true,
					command = true,
					model = { model = "claude-3.7-sonnet", temperature = 0.5, top_p = 1 },
					system_prompt = tech_writer_prompt,
				},
				{
					provider = "openai",
					name = "writer-o3-mini$$$",
					chat = true,
					command = true,
					model = { model = "o3-mini", temperature = 0.5, top_p = 1 },
					system_prompt = tech_writer_prompt,
				},
				{
					provider = "openai",
					name = "writer-gemini-2.5-pro-exp-03-25:free",
					chat = true,
					command = true,
					model = { model = "gemini-2.5-pro-exp-03-25:free", temperature = 0.5, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "writer-gemini-2.0-flash-001",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-001", temperature = 0.5, top_p = 1 },
					system_prompt = code_prompt,
				},
				---Models for codegen
				{
					provider = "openai",
					name = "code-qwen-2.5-coder-32b-instruct",
					chat = true,
					command = true,
					model = { model = "code-qwen-2.5-coder-32b-instruct", temperature = 0.2, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "code-gemini-2.0-flash-001",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-001", temperature = 0.2, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "code-gemini-2.5-pro-exp-03-25:free",
					chat = true,
					command = true,
					model = { model = "gemini-2.5-pro-exp-03-25:free", temperature = 0.2, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "code-claude-3.7-sonnet$$$",
					chat = true,
					command = true,
					model = { model = "claude-3.7-sonnet", temperature = 0.2, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "code-codestral-2501-code",
					chat = true,
					command = true,
					model = { model = "codestral-2501", temperature = 0.2, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "code-o3-mini$$$",
					chat = true,
					command = true,
					model = { model = "o3-mini", temperature = 0.2, top_p = 1 },
					system_prompt = code_prompt,
				},
				{
					provider = "openai",
					name = "code-o3-mini-high$$$$$$",
					chat = true,
					command = true,
					model = { model = "o3-mini-high", temperature = 0.2, top_p = 1 },
					system_prompt = code_prompt,
				},
                ---Models for translation
				{
					provider = "openai",
					name = "translate-gemini-2.0-flash-lite-001",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-lite-001", temperature = 0.3, top_p = 1 },
					system_prompt = translate_prompt,
				},
				{
					provider = "openai",
					name = "translate-gemini-2.0-flash-001",
					chat = true,
					command = true,
					model = { model = "gemini-2.0-flash-001", temperature = 0.3, top_p = 1 },
					system_prompt = translate_prompt,
				},
			},
		}
		require("gp").setup(conf)
		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
	end,
}

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		-- add any opts here
		-- for example
		provider = "bothub_claude_3_5_haiku",
		cursor_applying_provider = "bothub_gemini_2_0_flash",
		web_search_engine = {
			provider = "google", -- tavily, serpapi, searchapi, google or kagi
		},
		behaviour = {
			enable_cursor_planning_mode = true, -- enable cursor planning mode!
		},
		vendors = {
			bothub_gemini_2_5_thinking_exp = {
				__inherited_from = "openai",
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "gemini-2.5-pro-exp-03-25:free", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				reasoning_effort = "medium",
				max_tokens = 64000,
			},
			bothub_claude_3_5_haiku = {
				__inherited_from = "openai",
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "claude-3.5-haiku", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				reasoning_effort = "medium",
				max_tokens = 8192,
			},
			bothub_claude_3_5_sonnet = {
				__inherited_from = "openai",
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "claude-3.5-sonnet", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				reasoning_effort = "medium",
				max_tokens = 8192,
			},
			bothub_deepseek_r1 = {
				__inherited_from = "openai",
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "deepseek-r1", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				reasoning_effort = "medium",
				max_tokens = 8000,
			},
			bothub_deepseek_v3 = {
				__inherited_from = "openai",
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "deepseek-chat", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				reasoning_effort = "medium",
				max_tokens = 8000,
			},
			bothub_grok = {
				__inherited_from = "openai",
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "grok-beta", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				reasoning_effort = "medium",
				max_tokens = 8000,
			},
			bothub_llama_3_3_70b = {
				__inherited_from = "openai",
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "llama-3.3-70b-instruct", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				max_tokens = 4096,
			},
			bothub_gemini_2_0_flash = {
				__inherited_from = "openai",
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "gemini-2.0-flash-001", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				max_tokens = 4096,
			},
			bothub_qwen_2_5_coder = {
				__inherited_from = "openai",
				api_key_name = "OPENAI_API_KEY",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "qwen-2.5-coder-32b-instruct", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				max_tokens = 4096,
                disable_tools = true,
			},
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

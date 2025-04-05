local home = os.getenv("HOME")

local base_vendor_config = {
	__inherited_from = "openai",
	api_key_name = { "cat", home .. "/.config/openai_key" },
	endpoint = "https://bothub.chat/api/v2/openai/v1",
	timeout = 30000,
	temperature = 0,
	reasoning_effort = "medium",
	max_tokens = 8192,
}

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		-- add any opts here
		-- for example
		provider = "bothub_claude_3_5_haiku",
		cursor_applying_provider = "bothub_gemini_2_0_flash",
		behaviour = {
			enable_cursor_planning_mode = true, -- enable cursor planning mode!
		},
		vendors = {
			bothub_claude_3_5_haiku = vim.tbl_deep_extend("force", base_vendor_config, {
				model = "claude-3.5-haiku",
				max_tokens = 64000,
			}),
			bothub_gemini_2_0_flash = vim.tbl_deep_extend("force", base_vendor_config, {
				model = "gemini-2.0-flash-001",
				max_tokens = 64000,
			}),
			-- Example of how to add a new vendor with minimal configuration
			bothub_claude_3_5_sonnet = vim.tbl_deep_extend("force", base_vendor_config, {
				model = "claude-3.5-sonnet",
				max_tokens = 64000,
			}),
			-- Example of a vendor with slightly different configuration
			bothub_deepseek_chat = vim.tbl_deep_extend("force", base_vendor_config, {
				model = "deepseek-chat",
				max_tokens = 8000,
			}),
		},
		file_selector = {
			--- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string | fun(params: avante.file_selector.IParams|nil): nil
			provider = "fzf",
			-- Options override for custom providers
			provider_opts = {},
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

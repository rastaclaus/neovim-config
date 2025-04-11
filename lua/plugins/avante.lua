return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		windows = {
			width = 40, --
		},
		provider = "bothub-claude-3.5-haiku",
		cursor_applying_provider = "bothub-llama-3.1-70b-instruct",
		behaviour = {
			enable_cursor_planning_module = true,
		},

		system_prompt = function()
			local hub = require("mcphub").get_hub_instance()
			return hub:get_active_servers_prompt()
		end,
		-- Using function prevents requiring mcphub before it's loaded
		custom_tools = function()
			return {
				require("mcphub.extensions.avante").mcp_tool(),
			}
		end,

		vendors = {
			["bothub-claude-3.5-haiku"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "claude-3.5-haiku",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-claude-3.7-sonnet"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "claude-3.7-sonnet",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-claude-3.7-sonnet:thinking"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "claude-3.7-sonnet:thinking",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-llama-4-maverick"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "llama-4-maverick",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-llama-3.1-70b-instruct"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "llama-3.1-70b-instruct",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-deepseek-r1"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "deepseek-r1",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-qwen-qwen-2.5-coder-32b-instruct"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "qwen-2.5-coder-32b-instruct",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-gemini-2.0-flash-001"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "gemini-2.0-flash-001",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-gemini-2.5-pro-preview-03-25"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "gemini-2.5-pro-preview-03-25",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-llama-3.1-405b-instruct"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "llama-3.1-405b-instruct",
				api_key_name = "BOTHUB_API_KEY",
			},
			["bothub-optimus-alpha"] = {
				__inherited_from = "openai",
				endpoint = "https://bothub.chat/api/v2/openai/v1",
				model = "optimus-alpha",
				api_key_name = "BOTHUB_API_KEY",
			},
			["ntech-qwen2.5-coder-32b-instruct"] = {
				__inherited_from = "openai",
				endpoint = "https://llm-code.ntechlab.ru:36502/v1",
				model = "Qwen/Qwen2.5-Coder-32B-Instruct",
				api_key_name = "NTECH_API_KEY",
				disable_tools = true,
			},
			["ntech-qwen-2.5-72b-instruct"] = {
				__inherited_from = "openai",
				endpoint = "https://llm-common.ntechlab.ru:36507/v1",
				model = "Qwen/Qwen2.5-72B-Instruct",
				api_key_name = "NTECH_API_KEY",
				disable_tools = true,
			},
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
}

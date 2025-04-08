return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		provider = "bothub-claude-haiku",
        cursor_applying_provider = "bothub-gemini",
        behaviour = {
            enable_cursor_planning_module = true,
        },
        vendors = {
            ["bothub-claude-haiku"] = {
                __inherited_from = "openai",
                endpoint = "https://bothub.chat/api/v2/openai/v1",
                model = "claude-3.5-haiku",
                api_key_name = "BOTHUB_API_KEY",
            },
            ["bothub-deepseek"] = {
                __inherited_from = "openai",
                endpoint = "https://bothub.chat/api/v2/openai/v1",
                model = "deepseek-r1",
                api_key_name = "BOTHUB_API_KEY",
            },
            ["bothub-qwen"] = {
                __inherited_from = "openai",
                endpoint = "https://bothub.chat/api/v2/openai/v1",
                model = "qwen-2.5-coder-32b-instruct",
                api_key_name = "BOTHUB_API_KEY",
            },
            ["bothub-gemini"] = {
                __inherited_from = "openai",
                endpoint = "https://bothub.chat/api/v2/openai/v1",
                model = "gemini-2.0-flash-001",
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
            }
        }
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

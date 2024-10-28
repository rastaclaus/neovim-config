return {
    "robitx/gp.nvim",
    config = function()
        local home = os.getenv("HOME")
        local conf = {
            openai_api_key = {"cat", home .. "/.config/openai_key"},
            providers = {
                openai = {
                    disable = false,
                    endpoint = "https://bothub.chat/api/v2/openai/v1/chat/completions"
                }
            },
            log_file = vim.fn.stdpath("log"):gsub("/$", "") .. "/gp.nvim.log",
            default_command_agent = "claude-3.5-sonnet",
            default_chat_agent = "claude-3.5-sonnet",
            agents = {
                {
                    provider = "openai",
                    name = "claude-3.5-sonnet",
                    chat = true,
                    command = true,
                    model = { model = "claude-3.5-sonnet", temperature = 0.8, top_p = 1 },
                    system_prompt = require("gp.defaults").chat_system_prompt,
                }
            }
        }
        require("gp").setup(conf)

        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
}

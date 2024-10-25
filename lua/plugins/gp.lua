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
            log_file = vim.fn.stdpath("log"):gsub("/$", "") .. "/gp.nvim.log"
        }
        require("gp").setup(conf)

        -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
}

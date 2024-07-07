return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    local home = os.getenv("HOME")
    require("chatgpt").setup({
      api_key_cmd = 'cat ' .. home .. '/.config/openai_key',
      api_host_cmd = 'cat ' .. home .. '/.config/openai_url',
      openai_params = {
        model = "gpt-4o",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 50000,
        temperature = 0.2,
        top_p = 0.1,
        n = 1,
      },
      openai_edit_params = {
        model = "gpt-4o",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 50000,
        temperature = 0.2,
        top_p = 0.1,
        n = 1,
      }
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
     "folke/trouble.nvim",
  }
}

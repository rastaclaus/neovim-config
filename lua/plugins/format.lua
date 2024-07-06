return {
    'mhartington/formatter.nvim',
    config = function()
        require('formatter').setup({
            filetype = {
                python = {
                    -- Настройка ruff fix
                    function()
                        return {
                            exe = "ruff",
                            args = { "check", "--fix", "-" },
                            stdin = true,
                        }
                    end,
                    -- Настройка ruff format
                    function()
                        return {
                            exe = "ruff",
                            args = { "format", "-" },
                            stdin = true,
                        }
                    end,
                },
                go = {
                    -- Настройка gofmt
                    function()
                        return {
                            exe = "gofmt",
                            args = {},
                            stdin = true,
                        }
                    end,
                    function()
                        return {
                            exe = "goimports",
                            args = {},
                            stdin = true,
                        }
                    end,
                },
            },
        })

        -- Создание команды для форматирования с помощью F5
        vim.api.nvim_set_keymap('n', '<F5>', ':Format<CR>', { noremap = true, silent = true })
    end
}

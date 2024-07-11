return {
    'mhartington/formatter.nvim',
    config = function()
        local util = require "formatter.util"
        require('formatter').setup({
            filetype = {
                python = {
                    -- Настройка ruff fix
                    function()
                        return {
                            exe = "ruff",
                            args = { "check", "--fix", "-s", "-" },
                            stdin = true,
                            ignore_exitcode = true,
                        }
                    end,
                    -- Настройка ruff format
                    function()
                        return {
                            exe = "ruff",
                            args = { "format", "-" },
                            stdin = true,
                            ignore_exitcode = true,
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
                json = {
                    function()
                        return {
                            exe = "jq",
                            stdin = true,
                            ignore_exitcode = true,
                        }
                    end,
                },
                yaml = {
                    function()
                        return {
                            exe = "yamlfix",
                            stdin = true,
                            ignore_exitcode = true,
                        }
                    end,
                    function()
                        return {
                            exe = "yamlfmt",
                            stdin = true,
                            ignore_exitcode = true,
                        }
                    end,
                },

                sql = {
                    function()
                        return {
                            exe = "sql-formatter",
                            stdin = true
                        }
                    end,
                }
            },
        })

        -- Создание команды для форматирования с помощью F5
        vim.api.nvim_set_keymap('n', '<F5>', ':Format<CR>', { noremap = true, silent = true })
    end
}

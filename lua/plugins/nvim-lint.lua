return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            python = { "mypy" },
        }
        -- Настройка mypy

        local pattern = '([^:]+):(%d+):(%d+):(%d+):(%d+): (%a+): (.*)'
        local groups = { 'file', 'lnum', 'col', 'end_lnum', 'end_col', 'severity', 'message' }
        local severities = {
            error = vim.diagnostic.severity.ERROR,
            warning = vim.diagnostic.severity.WARN,
            note = vim.diagnostic.severity.HINT,
        }
        require('lint').linters.mypy = {
            cmd = function()
                local venv = os.getenv('VIRTUAL_ENV')
                if venv then
                    local mypy_path = venv .. '/bin/mypy'
                    local file = io.open(mypy_path, 'r')
                    if file then
                        io.close(file)
                        return mypy_path
                    end
                end
                return 'mypy'
            end,
            stdin = false,
            ignore_exitcode = true,
            args = {
                '--show-column-numbers',
                '--show-error-end',
                '--show-error-codes',
                '--hide-error-context',
                '--no-color-output',
                '--no-error-summary',
                '--no-pretty',
            },
            parser = require('lint.parser').from_pattern(
                pattern,
                groups,
                severities,
                { ['source'] = 'mypy' },
                { end_col_offset = 0 }
            ),

        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}

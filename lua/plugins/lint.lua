-- require("lint").linters.pylint = require("plugins/pylint")
-- require("lint").linters.mypy = require("plugins/mypy")
-- local ruff = require("lint").linters.ruff

local mypy = require("lint").linters.mypy

mypy.args = {
    "--show-column-numbers",
    "--show-error-codes",
    "--hide-error-context",
    "--no-color-output",
    "--no-error-summary",
    "--no-pretty"
}

require("lint").linters_by_ft = {
    python = {"ruff", "mypy", "pycodestyle"},
    yaml = {"yamllint"}
}

vim.diagnostic.config(
    {
        virtual_text = {
            source = "always",
            format = function(diagnostic)
                if diagnostic.user_data ~= nil then
                    if diagnostic.user_data.lsp.code ~= nil then
                        return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
                    end
                end
                return diagnostic.message
            end
        },
        underline = true
    }
)

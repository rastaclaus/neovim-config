-- require("lint").linters.pylint = require("plugins/pylint")
-- require("lint").linters.mypy = require("plugins/mypy")
local mypy = require('lint').linters.mypy
local ruff = require('lint').linters.ruff

mypy.args = {
    '--show-column-numbers',
    '--show-error-codes',
    '--hide-error-context',
    '--no-color-output',
    '--no-error-summary',
    '--no-pretty',
}

require("lint").linters_by_ft = {
    python = {"ruff", "mypy", "pycodestyle"},
    yaml = {"yamllint"}
}

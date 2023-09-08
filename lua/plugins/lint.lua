local mypy = require('lint').linters.mypy

mypy.args = {
    '--show-column-numbers',
    '--show-error-codes',
    '--hide-error-context',
    '--no-color-output',
    '--no-error-summary',
    '--no-pretty',
}

require("lint").linters_by_ft = {
    python = {"mypy"},
    yaml = {"yamllint"}
}

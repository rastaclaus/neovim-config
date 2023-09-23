vim.g.ale_use_neovim_diagnostics_api = 1

vim.g.ale_linters = {
    python = {"ruff", "mypy", "flake8"},
    yaml = {"yaml-language-server", "yamllint"},
    xml = {"xmllint"}
}

vim.g.ale_fixers = {
    python = {
        "black",
        "ruff"
    },
    yaml = {
        "prettier",
        "yamlfix",
    },
    xml = {
        "xmllint"
    }
}

vim.g.ale_completion_enabled = 0

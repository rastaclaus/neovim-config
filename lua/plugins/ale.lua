vim.g.ale_use_neovim_diagnostics_api = 1

vim.g.ale_linters = {
    python = {"ruff", "mypy", "flake8"},
    yaml = {"yaml-language-server", "yamllint", "spectral"},
    json = {"jq", "spectral"},
    xml = {"xmllint"},
    rust = {"rustc"}
}

vim.g.ale_fixers = {
    python = {
        "ruff",
        "ruff_format",
    },
    yaml = {
        "prettier",
        "yamlfix",
    },
    json = {
        "prettier",
        "jq",
    },
    xml = {
        "xmllint"
    },
    rust = {
        "rustfmt",
    }
}

vim.g.ale_completion_enabled = 0
-- vim.g.ale_rust_cargo_use_clippy = 1
-- vim.g.ale_rust_cargo_use_check = 0

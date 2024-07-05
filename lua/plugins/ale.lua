vim.g.ale_use_neovim_diagnostics_api = 1

-- Включаем виртуальный текст для отображения ошибок и предупреждений
vim.g.ale_virtualtext = 1
vim.g.ale_echo_msg_format = '%linter%; %code: %%s'

-- Дополнительные опции для настройки отображения
-- Устанавливаем цвет виртуального текста для ошибок
vim.cmd('highlight ALEVirtualTextError ctermfg=Red guifg=Red')
-- Устанавливаем цвет виртуального текста для предупреждений
vim.cmd('highlight ALEVirtualTextWarning ctermfg=Yellow guifg=Yellow')

vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      return string.format("%s %s: %s", diagnostic.source, diagnostic.code or "",  diagnostic.message)
    end,
  },

  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

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
    },
    go = {
        "golangci-lint",
    }
}

vim.g.ale_completion_enabled = 0

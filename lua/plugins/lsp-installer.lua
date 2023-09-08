-- Берем плагин для установки LSP
local lspinstaller = require "nvim-lsp-installer"

-- Конфигурация для LSP
local lspconfig = require "lspconfig"

-- Конфигурируем lsp-installer
lspinstaller.setup {
    ensure_installed = {
        "cssls", -- CSS
        "emmet_ls", -- HTML
        "pylsp", -- Python
        "clangd", -- c++
        "gopls", -- go
        "dockerls", -- dockerfiles
        "jsonls", -- json
        "yamlls" -- yaml
    }
}

-- Возможности редактора
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Добавляем возможность использовать сниппеты
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs(lspinstaller.get_installed_servers()) do
    lspconfig[server.name].setup {
        flags = {
            debounce_text_changes = 150
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    }
end

lspconfig.yamlls.setup(
    {
        settings = {
            yaml = {
                keyOrdering = false
            }
        }
    }
)

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                ruff = {enabled = true, lineLength = 120},
                pycodestyle = {enabled = true},
                black = {enabled = false},
                pyls_isort = {enabled = false},
                pylsp_mypy = {enabled = false},
                flake8 = {enabled = false},
                jedi_completion = {fuzzy = true}
            }
        }
    }
}

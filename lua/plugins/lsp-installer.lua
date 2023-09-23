-- Берем плагин для установки LSP
local lspinstaller = require "nvim-lsp-installer"

-- Конфигурация для LSP
local lspconfig = require "lspconfig"

-- Конфигурируем lsp-installer
lspinstaller.setup {
    ensure_installed = {
        "cssls", -- CSS
        "emmet_ls", -- HTML
        "pyright", -- Python
        "clangd", -- c++
        "gopls", -- go
        "dockerls", -- dockerfiles
        "jsonls", -- json
        "yamlls", -- yaml
        -- "efm" -- linters
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

lspconfig.pyright.setup {
    handlers = {
        ["textDocument/publishDiagnostics"] = function(...)
        end
    },
    root_dir = function(fname)
        local root_files = {
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'requirements.txt',
            'Pipfile',
            'pyrightconfig.json',
        }
        return lspconfig.util.root_pattern(unpack(root_files))(fname) or lspconfig.util.find_git_ancestor(fname) or lspconfig.util.path.dirname(fname)
    end,
    single_file_suport = true,
    settings = {
        pyright = {
            analisys = {
                autoSearchPaths = true,
                typeCheckingMode = "off",
                diagnosticMode = "workspace"
            }
        }
    }
}

lspconfig.yamlls.setup(
    {
        settings = {
            yaml = {
                keyOrdering = false
            }
        }
    }
)

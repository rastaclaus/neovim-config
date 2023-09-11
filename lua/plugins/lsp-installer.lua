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

local python_root_files = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "PipFile"
}

lspconfig.pyright.setup {
    handlers = {
        ["textDocument/publishDiagnostics"] = function(...)
        end
    },
    root_dir = lspconfig.util.root_pattern(python_root_files.unpack),
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

require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}
-- lspconfig.efm.setup {
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".git", python_root_files}
--     }
-- }

lspconfig.yamlls.setup(
    {
        settings = {
            yaml = {
                keyOrdering = false
            }
        }
    }
)

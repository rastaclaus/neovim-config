return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {},
        })

        on_attach_handler = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, bufopts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, bufopts)
            vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
        end


        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {
                    on_attach = on_attach_handler,
                    flags = {
                        debounce_text_changes = 150,
                    }
                }
            end,

            -- Next, you can provide a dedicated handler for specific servers.
            ["basedpyright"] = function()
                local lspconfig = require("lspconfig")

                lspconfig["basedpyright"].setup {
                    on_attach = on_attach_handler,
                    handlers = {
                        ["textDocument/publishDiagnostics"] = function(...) end
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
                        -- Проверка, существует ли table.unpack, и использование его
                        local unpack = table.unpack or unpack
                        local root_pattern = lspconfig.util.root_pattern(unpack(root_files))
                        return root_pattern(fname) or
                            lspconfig.util.find_git_ancestor(fname) or
                            lspconfig.util.path.dirname(fname)
                    end,
                    single_file_support = true,
                    settings = {
                        python = {
                            analysis = {
                                autoSearchPaths = true,
                                typeCheckingMode = "off",
                                diagnosticMode = "openFilesOnly"
                            }
                        }
                    }
                }
            end
        }
    end,
}

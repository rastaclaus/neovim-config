return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup({
            ensure_installed = {
                "basedpyright",
                "ruff",
            }
        })
        require("mason-lspconfig").setup({
            ensure_installed = {},
        })

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
                    single_file_support = true,
                    settings = {
                        basedpyright = {
                            analysis = {
                                -- ignore = {'*'},
                            }
                        },
                    }
                }
            end,
            ["ruff"] = function()
                local lspconfig = require("lspconfig")

                lspconfig["ruff"].setup( {
                    init_options = {
                        settings = {
                            configuration = "~/.ruff.toml",
                            configurationPreference ="filesystemFirst",
                        }
                    }
                })
            end,
        }
    end,
}

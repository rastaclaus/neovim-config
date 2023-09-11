local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "sainnhe/gruvbox-material", -- colorschems
    "neovim/nvim-lspconfig", -- LSP Server
    {
        "onsails/lspkind-nvim",
        config = function()
            require("plugins/lspkind")
        end
    },
    {
        "williamboman/nvim-lsp-installer",
        config = function()
            require("plugins/lsp-installer")
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua"
        },
        config = function()
            require("plugins/cmp")
        end
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    "lukas-reineke/indent-blankline.nvim", -- indent visualization
    "Exafunction/codeium.vim",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        },
        config = function()
            require("plugins/neo_tree")
        end
    },
    "jiangmiao/auto-pairs",
    "tpope/vim-surround",
    {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = function()
            require("plugins/lualine")
        end
    }, -- Статуслайн
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins/tree-sitter")
        end
    }, -- Плагин для подсветки синтаксиса
    {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/plenary.nvim"}}
    },
    {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    },
    "Vimjas/vim-python-pep8-indent",
    "tpope/vim-fugitive", -- Git
    "tpope/vim-repeat",

    'dense-analysis/ale' -- lint and format
}

require("lazy").setup(plugins, opts)
require("plugins/codeium")
require("plugins/ale")

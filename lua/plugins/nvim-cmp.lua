return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind-nvim",
	},

	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		lspkind.init({
			mode = "symbol",
			preset = "codicons",
			symbol_map = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "ﰠ",
				Variable = "",
				Class = "ﴯ",
				Interface = "",
				Module = "",
				Property = "ﰠ",
				Unit = "塞",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "פּ",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
		})

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- Luasnip expand
				end,
			},
			-- Клавиши, которые будут взаимодействовать в nvim-cmp
			mapping = {
				-- Вызов меню автодополнения
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<CR>"] = cmp.config.disable, -- Я не люблю, когда вещи автодополняются на <Enter>
				["<C-y>"] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок
				-- Используем <C-e> для того чтобы прервать автодополнение
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(), -- Прерываем автодополнение
					c = cmp.mapping.close(), -- Закрываем автодополнение
				}),
				["<C-j>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<C-k>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP 👄
				{ name = "nvim_lsp_signature_help" }, -- Помощь при введении параметров в методах 🚁
				{ name = "luasnip" }, -- Luasnip 🐌
				{ name = "buffer" }, -- Буфферы 🐃
				{ name = "path" }, -- Пути 🪤
				{ name = "emoji" }, -- Эмодзи 😳
			}, {}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 80, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				}),
			},
		})
	end,
}

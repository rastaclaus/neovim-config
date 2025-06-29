-- Пример настройки LSP
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	on_attach = function(client, bufnr)
		-- Включение встроенного автодополнения для клиента LSP
		-- Другие настройки (ключи, форматирование и т.д.)
	end,
})

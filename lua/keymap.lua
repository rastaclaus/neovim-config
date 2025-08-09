local wk = require("which-key")

wk.add({
	{ "<leader>q", "<cmd>qa<cr>", desc = "Quit" },
	{ "<leader>e", "<cmd>Oil<cr>", desc = "Oil" },
	{ "<leader>h", mode="n", function() vim.diagnostic.open_float() end, desc = "Show diagnostics under cursor" },

	-- Teminlal
	{ "<leader>t", "<cmd>term<cr>", desc = "Terminal" },
	{ "<ESC>", mode = "t", "<C-\\><C-N>", desc = "Normal Mode" },
	{ "<C-o>", mode = "t", "<C-\\><C-[>", desc = "Alacritty normal mode" },

	-- Format
	{ "<leader>lf", require("conform").format, desc = "Format Buffer" },
	{ "<leader>f", mode = { "v" }, require("conform").format, desc = "Format Selection" },

	-- Diagnostics
	{ "<leader>x", group = "diagnostic" },
	{ "<leader>xx", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
	{ "<leader>xw", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },

	-- Find
	{ "<leader>f", group = "Find" },
	{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
	{ "<leader>fg", "<cmd>FzfLua grep_project<cr>", desc = "Find in workspace" },
	{ "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Find helptags" },
	{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
	{ "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Find marks" },
	{ "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Find commands" },

	-- LSP
	{ "<leader>g", group = "lsp" },
	{ "<leader>ga", "<cmd>FzfLua lsp_code_actions<cr>", desc = "LSP code actions" },
	{ "<leader>gr", "<cmd>FzfLua lsp_references<cr>", desc = "LSP references" },
	{ "<leader>gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "LSP definitions" },
	{ "<leader>gf", "<cmd>FzfLua lsp_finder<cr>", desc = "LSP combine finder" },

	-- llm keys
	{ "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
	{ "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimCompare<cr>", desc = " Optimize the Code" },
	{ "<leader>ae", mode = "x", "<cmd>LLMAppHandler CodeExplain<cr>", desc = " Explain the Code" },
	{ "<leader>at", mode = "n", "<cmd>LLMAppHandler Translate<cr>", desc = " Translate Tool" },
	{ "<leader>ts", mode = "x", "<cmd>LLMAppHandler WordTranslate<cr>", desc = " Translate Text" },
})

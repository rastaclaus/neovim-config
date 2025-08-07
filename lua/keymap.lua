local wk = require("which-key")

wk.add({
	{ "<leader>q", "<cmd>qa<cr>", desc = "Quit" },
	{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explore files" },

	{ "<leader>lf", require("conform").format, desc = "Format Buffer" },

	{ mode = "v", "<leader>f", require("conform").format, desc = "Format Selection" },

	{ "<leader>f", group = "files" },
	{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
	{ "<leader>fg", "<cmd>FzfLua grep_project<cr>", desc = "Find in workspace" },
	{ "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Find files" },

	{ "<leader>x", group = "diagnostic" },
	{ "<leader>xx", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
	{ "<leader>xw", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },

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

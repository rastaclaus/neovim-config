return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "rust-project.json", ".git" },
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			imports = {
				granularity = {
					group = "module"
				},
				prefix = "self",
			},
			check = {
				command = "clippy",
			},
			inlayHints = {
				lifetimeElisionHints = { enable = true },
			},
		cargo = {
			loadOutDirsFromCheck = true,
			buildScripts = {
				enable = true,
			},
			allFeatures = true,
			features = "all",
		},
			procMacro = {
				enable = true,
			},
		},
	},
}

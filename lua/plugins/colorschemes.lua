require("gruvbox-material").setup({
	contrast = "hard",
	background = { transparent = false },
})

require("transparent").setup({})

require("darklight").setup({
	mode="custom",
	light_mode_callback = function()
		vim.cmd("TransparentDisable")
		vim.cmd("set bg=light")
		vim.cmd("colorscheme bamboo")
	end,
	dark_mode_callback = function()
		vim.cmd("set bg=dark")
		vim.cmd("colorscheme bamboo")
	end,
})

require("bamboo").setup({
	toggle_style_key = "<leader>bs"
})
vim.keymap.set("n", "<leader>bd", "<cmd>DarkLightSwitch<CR>", {noremap=true, desc="Dark/Light switch"})
vim.keymap.set("n", "<leader>bt", "<cmd>TransparentToggle<CR>", {noremap=true, desc="Transparency toggle"})

vim.cmd("colorscheme bamboo")

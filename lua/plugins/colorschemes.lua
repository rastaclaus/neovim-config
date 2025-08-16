require("bamboo").setup({})
require("gruvbox-material").setup({contrast="medium"})
require("transparent").setup({})
vim.keymap.set("n", "<leader>bt", "<cmd>TransparentToggle<CR>", {noremap=true, desc="Transparency toggle"})
vim.cmd.colorscheme("bamboo")


require("bamboo").setup({

})
require("transparent").setup({})
vim.keymap.set("n", "<leader>bt", "<cmd>TransparentToggle<CR>", {noremap=true, desc="Transparency toggle"})
vim.cmd.colorscheme("bamboo")

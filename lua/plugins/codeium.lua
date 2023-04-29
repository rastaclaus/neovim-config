vim.keymap.set(
    "i",
    "<c-;>",
    function()
        return vim.fn["codeium#CycleCompletions"](1)
    end,
    {expr = true}
)
vim.keymap.set(
    "i",
    "<c-,>",
    function()
        return vim.fn["codeium#CycleCompletions"](-1)
    end,
    {expr = true}
)
vim.keymap.set(
    "i",
    "<c-x>",
    function()
        return vim.fn["codeium#Clear"]()
    end,
    {expr = true}
)

vim.g.codeium_manual = true

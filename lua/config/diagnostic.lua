-- Настройка времени задержки для CursorHold
vim.opt.updatetime = 300

-- Настройка диагностик
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

-- Настройка знаков
-- local signs = { Error = "✘", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

-- Функция для отображения всплывающего окна с диагностикой
local function show_diagnostics_popup()
  local line = vim.fn.line('.')
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr, { lnum = line - 1 })

  if vim.tbl_isempty(diagnostics) then
    return
  end

  local opts = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = 'rounded',
    source = 'always',
    prefix = '',
  }
  vim.diagnostic.open_float(nil, opts)
end

-- Привязка команды на отображение всплывающего окна при наведении курсора
vim.api.nvim_create_autocmd("CursorHold", {
  callback = show_diagnostics_popup,
})

-- Настройка обновления диагностик при изменении текста
vim.cmd [[
  autocmd BufWritePost,TextChanged,InsertLeave * lua vim.diagnostic.setloclist({open = false})
]]

-- Настройка цветов для диагностики
vim.cmd [[
  highlight DiagnosticError guifg=#FF0000 ctermfg=Red
  highlight DiagnosticWarn guifg=#FFA500 ctermfg=Yellow
  highlight DiagnosticInfo guifg=#00FFFF ctermfg=Cyan
  highlight DiagnosticHint guifg=#00FF00 ctermfg=Green
]]

-- Подсветка строки с ошибкой
vim.cmd [[
  highlight DiagnosticUnderlineError gui=undercurl guisp=#FF0000 cterm=undercurl term=undercurl
  highlight DiagnosticUnderlineWarn gui=undercurl guisp=#FFA500 cterm=undercurl term=undercurl
  highlight DiagnosticUnderlineInfo gui=undercurl guisp=#00FFFF cterm=undercurl term=undercurl
  highlight DiagnosticUnderlineHint gui=undercurl guisp=#00FF00 cterm=undercurl term=undercurl
]]

-- Автокоманда для обновления диагностик при смене буфера/вкладки
-- vim.api.nvim_create_autocmd({ "BufEnter", "TabEnter" }, {
--   callback = function()
--     vim.diagnostic.setqflist({ open = false })
--   end,
-- })

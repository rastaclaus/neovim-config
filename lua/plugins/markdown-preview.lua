_G.open_markdown_preview = function(url)
  local browser_path = "/usr/bin/yandex-browser-stable"
  local command = string.format('%s %s', browser_path, url)
  vim.fn.system(command)
end

return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",

  init = function()
    vim.g.mkdp_filetypes = { "markdown" }

    vim.cmd([[
      function! OpenMarkdownPreview(url)
        call v:lua.open_markdown_preview(a:url)
      endfunction
    ]])

    vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'

  end,
  ft = { "markdown" },
}

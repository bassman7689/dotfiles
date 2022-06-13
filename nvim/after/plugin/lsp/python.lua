vim.cmd [[
augroup PythonAutoFormatter
  autocmd!
  autocmd BufWritePre *.py lua vim.lsp.buf.format(nil, 500)
augroup END
]]

require('lspconfig').pylsp.setup({})

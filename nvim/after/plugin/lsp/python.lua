vim.cmd [[
augroup PythonAutoFormatter
  autocmd!
  autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 500)
augroup END
]]

require('lspconfig').pylsp.setup({})

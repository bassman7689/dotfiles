vim.cmd [[
augroup VimLAutoFormatter
  autocmd!
  autocmd BufWritePre *.vim lua vim.lsp.buf.formatting_sync(nil, 500)
augroup END
]]

require('lspconfig').vimls.setup({})

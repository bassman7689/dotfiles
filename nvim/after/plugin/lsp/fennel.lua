vim.cmd [[
augroup FennelAutoFormatter
  autocmd!
  autocmd BufWritePre *.fnl lua vim.lsp.buf.formatting_sync(nil, 500)
augroup END
]]

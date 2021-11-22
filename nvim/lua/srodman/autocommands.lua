vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank()]]
vim.cmd [[au BufNewFile,BufRead *.asm set filetype=nasm]]

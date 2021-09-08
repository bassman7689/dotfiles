silent_keymaps = {
  { key = "gd", exec = ":lua vim.lsp.buf.definition()<CR>" },
  { key = "gD", exec = ":lua vim.lsp.buf.declaration()<CR>" },
  { key = "gr", exec = ":lua vim.lsp.buf.references()<CR>" },
  { key = "gi", exec = ":lua vim.lsp.buf.implementation()<CR>" },
  { key = "K", exec = ":lua vim.lsp.buf.hover()<CR>" },
  { key = "<C-k>", exec = ":lua vim.lsp.buf.signature_help()<CR>" },
  { key = "<C-n>", exec = ":lua vim.lsp.diagnostic.goto_prev()<CR>" },
  { key = "<C-p>", exec = ":lua vim.lsp.diagnostic.goto_next()<CR>" }
}

for _, map in ipairs(silent_keymaps) do
  vim.api.nvim_set_keymap('n', map.key, map.exec, {noremap = true, silent = true})
end

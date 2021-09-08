vim.bo.tabstop=2
vim.bo.softtabstop=2
vim.bo.shiftwidth=2

_G.lua_setup_cmp = function()
  require('cmp').setup.buffer({
      sources = {
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lua"},
        { name = "nvim_lsp"},
        { name = 'luasnip' },
      },
    })
end

vim.cmd[[ augroup SRodmanFileTypeLua ]]
vim.cmd[[ autocmd! ]]
vim.cmd[[ autocmd FileType lua v:lua.lua_setup_cmp() ]]
vim.cmd[[ augroup END ]]

if vim.g.loaded_matchit == 1 then
  local match_words = "\\<\\%(do\\|function\\|if\\)\\>:" ..
    "\\<\\%(return\\|else\\|elseif\\)\\>:" ..
    "\\<end\\>," ..
    "\\<repeat\\>:\\<until\\>"

  vim.api.nvim_buf_set_var(0, "match_ignorecase", 0)
  vim.api.nvim_buf_set_var(0, "match_words", match_words)
end

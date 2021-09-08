vim.cmd [[
augroup RustAutoFormatter
  autocmd!
  autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 500)
augroup END
]]

--require('rust-tools').setup({})
-- Fpr debugging rust-analyzer loading problems
-- require('rust-tools').setup({
--     server={
--       cmd_env = {
--         RA_LOG = "rust_analyzer=debug",
--       },
--       settings = {
--         ["rust-analyzer"] = {
--           trace={
--             server="verbose",
--           },
--         }
--       }
--     }
--   })

--require('rust-tools.runnables').runnables()
-- setup a mapping to switch to the Cargo.toml in rust projects
--vim.api.nvim_set_keymap('n', '<Leader>rc', ':lua require(\'rust-tools.open_cargo_toml\').open_cargo_toml()<CR>', {noremap = true, silent = true})
--
require('lspconfig').rust_analyzer.setup({
  cmd_env = {
    RA_LOG = "project_model=debug",
  },
  settings = {
    ["rust-analyzer"] = {
      trace={
        server="verbose",
      },
    }
  }
})

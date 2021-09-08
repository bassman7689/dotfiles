if require('srodman.first_run')() then
  return
end

-- Set leader (need to set this as early as possible)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require('srodman.packer')
require('srodman.autocommands')

vim.api.nvim_command('command! -nargs=1 Exec :lua require(\'srodman.helpers\').exec(<q-args>)')
vim.api.nvim_command('command! -nargs=? Scriptnames :lua require(\'srodman.helpers\').scriptnames(<q-args>)')

-- vim.cmd [[ syntax on ]]
-- vim.cmd [[ filtype plugin indent on ]]

local opt = vim.opt
opt.backup = false
opt.colorcolumn = '80'
opt.expandtab = true
opt.guicursor = ''
opt.hlsearch = false
opt.inccommand = 'split'
opt.incsearch = true
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.signcolumn = 'yes'
opt.smartindent = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.updatetime = 100
opt.wrap = false
opt.hidden = true
-- setup completion options
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
opt.completeopt={"menuone", "noinsert", "noselect"}


vim.cmd [[packadd packer.nvim]]

-- Find a better place to put this, has to be set before vimwiki is installed
-- for some reason.
vim.g.vimwiki_list = {{path="~/vimwiki/", syntax="markdown", ext=".md"}}

return require('packer').startup(function(use)
  -- have packer manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
  }

  -- tons of language highlight goodness
  use 'sheerun/vim-polyglot'

  -- awesome statusline
  use {
    'vim-airline/vim-airline',
    requires = {
      'joshdick/onedark.vim'
    },
    after = {
      'joshdick/onedark.vim'
    },
    config = function()
      vim.g.airline_theme = 'onedark'
    end,
  }

  -- configure the builtin lsp
  use 'neovim/nvim-lspconfig'

  -- Extensions to built-in LSP, for example, providing type inlay hints
  use 'nvim-lua/lsp_extensions.nvim'

  -- Debugging goodness!
  use 'mfussenegger/nvim-dap'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- snippet plugin
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      'rafamadriz/friendly-snippets'
    },
  }

  use {
    'joshdick/onedark.vim',
    config = function()
      vim.opt.termguicolors = true
      vim.cmd [[colorscheme onedark]]
    end,
  }

  -- cool startup screen
  use 'mhinz/vim-startify'

  -- local autosave.nvim plugin, my first plugin!
  -- use '~/nvim_plugins/autosave.nvim'

  -- Personal wiki testing
  use 'vimwiki/vimwiki'
  -- for markdown rendering
  -- use {
  --   'npxbr/glow.nvim',
  --   run = ':GlowInstall',
  -- }

  -- Need to change surrounding things too much not to have this
  -- Plus, Its tpope!
  use 'tpope/vim-surround'

  -- Need commenting goodness
  use 'tpope/vim-commentary'

  -- For repeating surround and other tpope plugins
  use 'tpope/vim-repeat'

  -- Awesomeness for vcs
  use 'mhinz/vim-signify'

  -- Awesome Lisp Environment
  use 'Olical/conjure'

  -- Fennel setup with Aniseed for nvim
  use {
    'Olical/nvim-local-fennel',
    requires = {
      'Olical/aniseed',
    },
    tag = "v2.12.2",
  }

  -- Auto Pairs of things
  use 'jiangmiao/auto-pairs'
end)

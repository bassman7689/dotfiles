require('nvim-treesitter.configs').setup({
	ensure_installed = { "ruby", "c", "cpp", "rust", "go" },
	sync_install = false,
	highlight = {
		enable = true,
	},
})

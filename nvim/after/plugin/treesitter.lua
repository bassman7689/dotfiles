require('nvim-treesitter.configs').setup({
	ensure_installed = { "ruby", "c", "cpp", "rust", "go" },
	sync_install = false,
	highlight = {
		enable = true,
	},
})

require('treesitter-context').setup({
	enable = true,
	max_lines = 0,
})

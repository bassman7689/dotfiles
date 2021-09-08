vim.cmd [[
augroup LuaAutoFormatter
  autocmd!
  autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 500)
augroup END
]]

local sumneko_root_path = '/Users/srodman/code/lua-language-server/'
local sumneko_binary = sumneko_root_path .. 'bin/macOS/lua-language-server'

local runtime_path = vim.split(package.path, ':')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('lspconfig').sumneko_lua.setup({
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "main.lua"},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim
				version = 'LuaJIT',
				path = runtime_path,
			},
	   	diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enabled = false,
			},
		},
	},
})
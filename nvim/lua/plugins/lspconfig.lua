require("trouble").setup({
	mode = "quickfix",
})

require("lspconfig").tsserver.setup({})
require("lspconfig").eslint.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").rls.setup({})
require("lspconfig").luau_lsp.setup({})
require("lspconfig").jedi_language_server.setup({})
--require("lspconfig").rust_analyzer.setup({})
require("lspconfig").sumneko_lua.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

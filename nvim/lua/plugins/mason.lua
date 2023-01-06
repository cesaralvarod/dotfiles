require("mason").setup()
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	ensure_installed = {
		"sumneko_lua",
		"blade-formatter",
		"dockerfile-language-server",
		"emmet-ls",
		"go-debug-adapter",
		"golangci-lint",
		"gopls",
		"html-lsp",
		"json-lsp",
		"lua-language-server",
		"php-debug-adapter",
		"rust-analyzer",
		"stylua",
		"typescript-language-server",
		"vue-language-server",
		"phpactor",
		"sql-formatter",
		"pyright",
	},
})
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
})

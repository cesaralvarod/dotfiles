require("trouble").setup({
	mode = "quickfix",
})

require("lspconfig").tsserver.setup({})
require("lspconfig").eslint.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").rls.setup({})
require("lspconfig").luau_lsp.setup({})
require("lspconfig").jedi_language_server.setup({})

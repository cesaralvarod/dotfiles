local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	ensure_installed = {
		"lua",
		"javascript",
		"typescript",
		"json",
		"css",
		"html",
		"vue",
		"svelte",
		"gitignore",
		"vim",
		"solidity",
		"graphql",
		"php",
		"java",
		"kotlin",
		"c",
		"cpp",
		"arduino",
		"rust",
		"ruby",
		"bash",
		"python",
		"tsx",
		"yaml",
		"markdown",
		"markdown_inline",
	},
})

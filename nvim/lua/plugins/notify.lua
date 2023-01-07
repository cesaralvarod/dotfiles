local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	notify = {
		clear_time = 3000,
	},
	components = {
		"nvim",
		"lsp",
	},
})

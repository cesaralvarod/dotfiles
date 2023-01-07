local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
	return
end

signature.setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handlers_opts = {
		border = "rounded",
	},
})

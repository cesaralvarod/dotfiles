local null_ls = require("null-ls")

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

local sources = {
  formatting.prettier, -- js, ts, tsx, jsx, css, html, etc files
  formatting.autopep8, -- python files
  formatting.stylua, -- lua files
  formatting.beautysh, -- sh file
  formatting.clang_format, -- java, cpp, c, cuda files
  formatting.phpcsfixer, -- php files
  formatting.trim_whitespace,
  formatting.trim_newlines,
}

local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({sync=true})")
  end
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach,
})

-- :echo executable("<SOURCE>") para ver si existe el ejecutable de ese lsp server

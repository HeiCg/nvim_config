local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    -- formatting
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.trim_whitespace,
    formatting.eslint_d.with({ prefer_local = "node_modules/.bin" }),
    -- diagnostics
    -- diagnostics.eslint_d.with({ prefer_local = "node_modules/.bin" }),
    -- code_actions
    code_actions.eslint_d.with({ prefer_local = "node_modules/.bin" }),
  },
  on_attach = function()
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end,
})

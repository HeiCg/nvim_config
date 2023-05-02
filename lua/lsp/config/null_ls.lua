local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client) return client.name == "null-ls" end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.autopep8,
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.black,
        },
      }
    end,
    config = function(_, opts)
      require("null-ls").setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function() lsp_formatting(bufnr) end,
            })
          end
        end,
        sources = opts.sources,
      })
    end,
  },
}

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
          nls.builtins.formatting.stylua.with({
            condition = function(utils) return utils.root_has_file({ "stylua.toml", ".stylua.toml" }) end,
          }),
          nls.builtins.formatting.trim_whitespace,
          nls.builtins.formatting.trim_newlines,
          nls.builtins.formatting.shfmt,
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.autopep8,
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.black,
          nls.builtins.completion.spell,
          nls.builtins.completion.tags,
          nls.builtins.formatting.jq,
          nls.builtins.formatting.nginx_beautifier,
          nls.builtins.formatting.sql_formatter,
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

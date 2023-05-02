local setup = "lsp.config."
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/schemastore.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      require(setup .. "lsp_handler").setup()
      local servers = {
        "jsonls",
        "lua_ls",
        "jedi_language_server", -- python
        "html",
        "cssls",
        "cssmodules_ls",
        "emmet_ls",
        "tsserver",
        "bashls",
        "clangd",
        "dockerls",
        "elmls",
        "kotlin_language_server",
        "rust_analyzer",
      }
      local opts = {
        on_attach = require(setup .. "lsp_handler").on_attach,
        capabilities = require(setup .. "lsp_handler").capabilities,
      }

      local lsp_installer = require("mason-lspconfig")
      lsp_installer.setup({
        ensure_installed = servers,
        automatic_installation = true,
      })

      local lsp_servers = "lsp.servers."
      for _, lsp in ipairs(servers) do
        local has_custom_opts, server_custom_opts = pcall(require, lsp_servers .. lsp)
        if has_custom_opts then
          opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
        end
        if lsp == "jsonls" then
          lspconfig[lsp].setup({
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          })
        end
        lspconfig[lsp].setup(opts)
      end
    end,
  },
}

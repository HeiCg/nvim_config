local status_mason, mason = pcall(require, "mason")
if not status_mason then
  return
end
mason.setup()

local status_lsp, lsp_installer = pcall(require, "mason-lspconfig")
if not status_lsp then
  return
end

local servers = {
  "jsonls",
  "sumneko_lua", -- lua
  "jedi_language_server", -- python
  "html",
  "cssls",
  "cssmodules_ls",
  "tsserver", -- javascript/typescript
  "emmet_ls",
  "bashls",
  "clangd",
  "dockerls",
  "elmls",
  -- "hls", -- haskell
  "rnix", -- nix
}
lsp_installer.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- Add additional capabilities supported by nvim-cmp
local lspconfig = require("lspconfig")

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
  local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. lsp)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  if lsp == "jdtls" then
    lspconfig.jdtls.setup(opts)
    return
  end
  if lsp == "clangd" then
    -- Minimal config to reproduce the warning
    local clangd_capabilities = opts.capabilities
    clangd_capabilities.offsetEncoding = "utf-8"
  end
  lspconfig[lsp].setup(opts)
end

local M = {}

M.setup = function()
  for name, icon in pairs(require("util").icons.diagnostics) do
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { texthl = name, text = icon, numhl = "" })
  end

  local config = {
    virtual_lines = false,
    virtual_text = false,
  }

  vim.diagnostic.config(config)
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  client.server_capabilities.semanticTokensProvider = nil
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  --- In lsp attach function
  local map = vim.api.nvim_buf_set_keymap

  -- map(bufnr, "n", "<F2>", "<cmd>Lspsaga rename<cr>", opts)
  map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
  map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
  map(bufnr, "n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
  map(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
end

-- format capabilities disabled by default
local function lsp_no_format(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

-- local function lsp_virtual_types(client)
--   if client.supports_method("textDocument/codeLens") then
--     client.setup({ on_attach = require("virtualtypes").on_attach })
--   end
-- end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
  lsp_no_format(client)
  if client.name == "jedi_language_server" then
    client.handlers["textDocument/publishDiagnostics"] = function(...) end
    local ns = vim.lsp.diagnostic.get_namespace(client.id)
    vim.diagnostic.disable(nil, ns)
    vim.diagnostic.config({ false })
  end
  -- lsp_virtual_types(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return M

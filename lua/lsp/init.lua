local setup = "lsp.config."
local M = {
  require(setup .. "mason"),
  require(setup .. "lspconfig"),
  require(setup .. "cmp"),
  require(setup .. "lsp_lines"),
  require(setup .. "null_ls"),
}

return M

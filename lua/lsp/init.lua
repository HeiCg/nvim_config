local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.cmp")
require("lsp.handlers").setup()
require("lsp.mason")
require("lsp.null_ls")
require("lsp.lspsaga")

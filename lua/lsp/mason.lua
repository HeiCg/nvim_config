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
	"emmet_ls",
	"bashls",
	"clangd",
	"dockerls",
	"elmls",
}

lsp_installer.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- Add additional capabilities supported by nvim-cmp
local lspconfig = require("lspconfig")

local opts = {
	on_attach = require("lsp.handlers").on_attach,
	capabilities = require("lsp.handlers").capabilities,
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
	local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. lsp)
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
	else
		lspconfig[lsp].setup(opts)
	end
end

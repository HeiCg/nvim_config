return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim", "unpack" },
			},
			-- ["completion.workspaceWord"] = false,
			-- ["completion.showWord"] = "Disable",
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}

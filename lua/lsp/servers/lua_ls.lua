return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "unpack" },
      },
      workspace = {
        checkThirdParty = false,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

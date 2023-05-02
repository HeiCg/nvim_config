return {
  --cmd = { },
  --root_dir = ,
  settings = {
    jedi = {
      enable = true,
      startupMessage = true,
      markupKindPreferred = "markdown",
      jediSettings = {
        caseInsensitiveCompletion = true,
        autoImportconfigs = {},
      },
      workspace = { extraPaths = { "lib" } },
      diagnostics = {
        enable = false,
        didOpen = false,
        didChange = false,
        didSave = false,
      },
    },
  },
}

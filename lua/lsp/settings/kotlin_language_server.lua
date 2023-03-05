local lspconfig = require("lspconfig")
return {
  default_config = {
    root_dir = lspconfig.util.root_pattern(".git", "build.xml", "settings.gradle", "settings.gradle.kts"),
  },
}

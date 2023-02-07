local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  return
end

project.setup({
  active = true,
  -- Manual mode doesn't automatically change your root directory, so you have
  -- the option to manually do so using `:ProjectRoot` command.
  manual_mode = false,

  detection_methods = {
    -- "lsp",
    "pattern",
  },

  patterns = {
    "=repos",
    ".git",
    "package.json",
    "elm.json",
  },

  ignore_lsp = {},
  exclude_dirs = {},
  show_hidden = false,
  silent_chdir = true,
  scope_chdir = "global",
  datapath = vim.fn.stdpath("data"),
})

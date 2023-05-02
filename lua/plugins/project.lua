return {
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    opts = {
      active = true,
      -- Manual mode doesn't automatically change your root directory, so you have
      -- the option to manually do so using `:ProjectRoot` command.
      manual_mode = false,

      detection_methods = {
        "lsp",
        "pattern",
      },

      patterns = {
        -- "=repos",
        ".git",
        "elm.json",
      },

      ignore_lsp = {},
      exclude_dirs = {},
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = "global",
      datapath = vim.fn.stdpath("data"),

      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    },
    config = function(_, opts) require("project_nvim").setup(opts) end,
  },
}

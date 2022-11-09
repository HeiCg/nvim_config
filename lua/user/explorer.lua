local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  filters = {
    dotfiles = false,
    custom = { "node_modules" },
    exclude = {},
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "alpha",
    "dashboard",
    "startify",
  },
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },

  view = {
    adaptive_size = true,
    side = "left",
    width = 30,
    number = false,
    relativenumber = false,
    hide_root_folder = false,
  },

  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },

  filesystem_watchers = {
    enable = true,
  },

  actions = {
    open_file = {
      resize_window = false,
      quit_on_open = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },

  renderer = {
    root_folder_modifier = ":~",
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})

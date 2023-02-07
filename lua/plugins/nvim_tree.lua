local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local ui = vim.api.nvim_list_uis()[1]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
	reload_on_bufenter = true,
	filters = {
		dotfiles = false,
		custom = { "node_modules" },
		exclude = {},
	},
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},

	view = {
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				title = " file explorer ",
				title_pos = "center",
				border = "rounded",
				width = 100,
				height = 30,
				col = math.ceil((ui.width - 100) / 2),
				row = math.ceil((ui.height - 30) / 2) - 1,
			},
		},
		adaptive_size = false,
		centralize_selection = false,
		number = false,
		relativenumber = false,
		hide_root_folder = false,
		preserve_window_proportions = true,
		signcolumn = "yes",
	},

	git = {
		enable = true,
		ignore = false,
		timeout = 100,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},

	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},

	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		open_file = {
			resize_window = false,
			quit_on_open = false,
		},
	},

	renderer = {
		root_folder_modifier = ":~",
		add_trailing = false,
		group_empty = false,
		highlight_git = true,
		full_name = false,
		highlight_opened_files = "none",
		indent_width = 2,
		symlink_destination = true,
		indent_markers = {
			enable = false,
			inline_arrows = true,
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
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
})

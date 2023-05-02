local Util = require("util")

return {
  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    keys = {
      { "<leader>bg", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
      { "<leader>bpc", "<cmd>BufferLinePickClose<CR>", desc = "Close Buffer" },
      { "<leader>b]", "<cmd>BufferLineCloseRight<CR>", desc = "Close Right" },
      { "<leader>b[", "<cmd>BufferLineCloseLeft<CR>", desc = "Close Left" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      options = {
        mode = "buffers",
        numbers = "none",
        right_mouse_command = "vert sbuffer %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",
        close_command = function(bufnr) Util.buf_kill("bd", bufnr, false) end,
        always_show_bufferline = true,
        gnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local icons = require("util.icons").diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        indicator = {
          icon = "▎",
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
      },
    },
  },
}

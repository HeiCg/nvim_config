local _ = {}
_.hide_in_width = function() return vim.fn.winwidth(0) > 80 end

_.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = {
    "error",
    "warn",
    -- "hint"
  },
  symbols = {
    error = " ",
    warn = " ",
    --[[hint = " "]]
  },
  color = { bg = "black", gui = "bold" },
  colored = true,
  update_in_insert = false,
  always_visible = true,
  separator = { right = "" },
}

_.diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = _.hide_in_width,
}

_.mode = {
  "mode",
  -- fmt = function(str) return "-- " .. str .. " --" end,
  separator = { left = "" },
  right_padding = 2,
}

_.venvName = function()
  if vim.bo.filetype ~= "python" then
    return ""
  elseif vim.env.VIRTUAL_ENV then
    local venv = vim.env.VIRTUAL_ENV:sub(vim.env.VIRTUAL_ENV:find("/[^/]*$") + 1)
    return venv
    -- return venv .. vim.cmd("python print((sys.version).split(' ')[0])")
  end
  return ""
end

_.filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

_.branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  color = { bg = "black", fg = "white", gui = "bold" },
}

_.spaces = function() return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local icons = require("util").icons
    return {
      options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        component_separators = "|",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { _.mode },
        lualine_b = { _.branch, _.diagnostics },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          _.venvName,
          -- stylua: ignore
        },
        lualine_x = {
            -- stylua: ignore
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          _.spaces,
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          function() return " " .. os.date("%R") end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}

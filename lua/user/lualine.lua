local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function() return vim.fn.winwidth(0) > 80 end

local diagnostics = {
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

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
  "mode",
  -- fmt = function(str) return "-- " .. str .. " --" end,
  separator = { left = "" },
  right_padding = 2,
}

local venvName = function()
  if vim.bo.filetype ~= "python" then
    return ""
  elseif vim.env.VIRTUAL_ENV then
    local venv = vim.env.VIRTUAL_ENV:sub(vim.env.VIRTUAL_ENV:find("/[^/]*$") + 1)
    return venv
    -- return venv .. vim.cmd("python print((sys.version).split(' ')[0])")
  end
  return ""
end

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  color = { bg = "black", fg = "white", gui = "bold" },
}

local spaces = function() return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") end

lualine.setup({
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "rose-pine",
    --[[ component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" }, ]]
    component_separators = "|",
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch, diagnostics },
    lualine_c = { filetype, venvName },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { diff, spaces, "encoding" },
    lualine_y = {},
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

vim.g.markdown_recommended_style = 0
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = function(set, opt) vim.opt[set] = opt end

local shortmess = function(opt) vim.opt.shortmess:append(opt) end

local enable = function(opt) set(opt, true) end
local disable = function(opt) set(opt, false) end

local format_flags = {
  j, -- Where it makes sense, remove a comment leader when joining line
  r, -- Automatically insert the current comment leader after hitting	<Enter> in Insert mode.
  o, -- Automatically insert the current comment leader after hitting 'o' or	'O' in Normal mode.
  q, -- Allow formatting of comments with "gq".
  l, -- Long lines are not broken in insert mode
  n, -- When formatting text, recognize numbered lists
  c, -- Auto-wrap comments using 'textwidth'
  t, -- Auto-wrap text using 'textwidth'
}

-- indention
enable("autoindent") -- Copy indent from current line when starting a new line
enable("expandtab") -- use spaces instead of tabs
set("shiftwidth", 2) -- size of an indentation
set("tabstop", 2) -- number of spaces that a TAB in the file counts for
set("softtabstop", 2) -- number of columns for a TAB
set("showtabline", 2)
set("numberwidth", 2)
enable("smarttab")
enable("smartindent")
enable("shiftround")

-- general configs
enable("number")
set("conceallevel", 3) -- hide * markup for bold and italic
enable("confirm") -- confirm to save changes before exiting modified buffer
enable("cursorline") -- enable highlighting of the current line
enable("autowrite") -- write the contents of the file, if it has been modified, on each :next, :rewind, :last, :first, :previous, :stop
set("clipboard", "unnamedplus") -- sync with system clipboard
set("spelllang", "en_us")
set("conceallevel", 3)
enable("ignorecase")
set("grepformat", "%f:%l:%c:%m")
set("completeopt", "menu,menuone,noselect")
set("formatoptions", table.concat(format_flags, ""))
set("laststatus", 0)
set("mouse", "a")
set("pumblend", 10) -- pseudo-transparency for the popup-menu
set("pumheight", 10) -- Maximum number of entries in a popup
set("scrolloff", 100)
set("sidescrolloff", 8) -- Columns of context
set("signcolumn", "yes:1") -- Always show the signcolumn, otherwise it would shift the text each time
enable("splitbelow")
enable("splitright")
set("splitkeep", vim.fn.has("nvim-0.9") == 1 and "screen" or nil)
enable("termguicolors") -- True color support
set("timeoutlen", 500)
enable("undofile")
set("undolevels", 10000)
set("updatetime", 200) -- Save swap file and trigger CursorHold
set("foldmethod", "expr")
set("grepprg", "rg --vimgrep")
set("sessionoptions", { "buffers", "curdir", "tabpages", "winsize" })
set("fillchars", { eob = " " })
enable("acd")

-- disabled
disable("wrap")
disable("writebackup")
disable("swapfile")
disable("backup")

local shortmess_flags = {
  c, -- don't give ins-completion-menu messages
  C, -- don't give messages while scanning for ins-completion items
  W, -- don't give "written" or "[w]" when writing a file
  I, -- don't give the intro message when starting Vim
}

for _, opt in ipairs(shortmess_flags) do
  shortmess(opt)
  -- vim.opt.shortmess:append(opts)
end
vim.cmd("set noequalalways") -- disable auto resize when splitting or closing a window

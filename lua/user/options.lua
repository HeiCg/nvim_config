local options = {
  -- Encoding
  encoding = "utf-8",
  fileencoding = "utf-8",                  -- the encoding written to a file

  -- Tabs. May be overriding by autocommands
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  smartindent = true,                      -- make indenting smarter again

  -- Searching
  hlsearch = true,                         -- highlight all matches on previous search pattern
  incsearch = true,                        -- incremental search
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case
  inccommand = "split",

  -- Command tab completion
  wildmenu = true,
  -- wildmode = "longest:list:full",

  -- Editor config
  -- foldmethod = "expr",                     -- folding, set to "expr" for treesitter based folding
  -- foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  confirm = true,                          -- handle crashes due to unsaved changes to a buffer, instead raise a dialog asking if you wish to save the current file
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  backspace = "indent,eol,start",
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  conceallevel = 0,                        -- so that `` is visible in markdown files
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showtabline = 2,                         -- always show tabs
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  ttimeoutlen = 200,			                   -- the time in milliseconds that is waited for a key code or mapped key sequence to complete.
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  numberwidth = 2,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  scrolloff = 8,
  sidescrolloff = 8,
  ttyfast = true,
  colorcolumn = "99999",
  ic = true,                               -- ignore case type
  hidden = true,                           -- ignore unsaved buffers
  showmode = false,                         -- to show the current mode

  -- disables
  wrap = false,                            -- display lines as one long line
  relativenumber = false,                  -- set relative numbered lines
  backup = false,                          -- creates a backup file
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  swapfile = false,                        -- creates a swapfile
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]] -- Stop newline comments.

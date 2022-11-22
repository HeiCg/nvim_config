local options = {
  -- Encoding
  encoding = "utf-8",
  fileencoding = "utf-8",

  -- Tabs. May be overriding by autocommands
  autoindent = true,
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,
  tabstop = 2,
  softtabstop = 2,

  -- Searching
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  inccommand = "split",

  -- Command tab completion
  wildmenu = true,
  -- wildmode = "longest:list:full",

  -- Editor config
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  laststatus = 3,

  title = true,
  clipboard = "unnamedplus",
  cursorline = true,

  mouse = "a",

  number = true,
  numberwidth = 2,
  ruler = false,
  termguicolors = true,

  signcolumn = "yes",
  showtabline = 2,
  splitbelow = true,
  splitright = true,

  timeoutlen = 1000,
  ttimeoutlen = 200,
  updatetime = 300,

  confirm = true,
  cmdheight = 1,
  completeopt = { "menu", "menuone", "noselect" },
  backspace = "indent,eol,start",
  conceallevel = 1,
  pumheight = 10,
  undofile = true,
  scrolloff = 8,
  sidescrolloff = 8,
  ttyfast = true,
  colorcolumn = "80",
  textwidth = 80,
  ic = true,
  hidden = true,

  relativenumber = false,
  backup = false,
  writebackup = false,
  swapfile = false,
  showmode = false,
}

vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")

for k, v in pairs(options) do
  vim.opt[k] = v
end

--vim.cmd "set whichwrap+=<,>,[,],h,l"
--vim.cmd [[set iskeyword+=-]]
--vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]] -- Stop newline comments.

local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	autoindent = true,
	expandtab = true,
	shiftwidth = 2,
	smartindent = true,
	tabstop = 2,
	softtabstop = 2,
	hlsearch = true,
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	inccommand = "split",
	wildmenu = true,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
	foldlevel = 999,
	title = true,
	clipboard = "unnamedplus",
	cursorline = true,
	wrap = false,
	mouse = "a",
	number = true,
	numberwidth = 2,
	signcolumn = "yes:1",
	showtabline = 2,
	splitbelow = true,
	splitright = true,
	timeoutlen = 1000,
	--  ttimeoutlen = 300,
	updatetime = 300,
	confirm = true,
	cmdheight = 1,
	completeopt = { "menu", "noselect" },
	conceallevel = 1,
	pumheight = 5,
	undofile = true,
	scrolloff = 8,
	sidescrolloff = 8,
	ic = true,
	hidden = true,
	spelllang = { "en" },
	backup = false,
	writebackup = false,
	swapfile = false,
	showmode = false,
	grepprg = "rg --vimgrep",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c") -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append("I") -- don't show the default intro message
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.cmd("set noequalalways") -- disable auto resize when splitting or closing a window

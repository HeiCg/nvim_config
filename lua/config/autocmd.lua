-- This file is automatically loaded by plugins.init

local function augroup(name) return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true }) end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function() vim.highlight.on_yank() end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.cmd([[
  augroup _syntax_symbols
    autocmd!
    autocmd BufwinEnter * :syntax match keyword "lambda" conceal cchar=λ
    autocmd BufwinEnter * :set conceallevel=1
  augroup end
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd BufRead,BufNewFile *.scss set filetype=scss.css
    autocmd FileType scss set iskeyword+=-
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd BufEnter *.md setlocal conceallevel=0
    " autocmd FileType markdown MarkdownPreview
  augroup end
  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
  augroup _handlebars
    autocmd!
    au BufNewFile,BufRead *.handlebars set filetype=html
    au BufNewFile,BufRead *.handlebars set syntax=html
  augroup end
  augroup _kotlin
    autocmd!
    au BufNewFile,BufRead *.kt setlocal shiftwidth=4
    au BufNewFile,BufRead *.kt setlocal tabstop=4
    au BufNewFile,BufRead *.kt setlocal softtabstop=4
    " au BufNewFile,BufRead *.kt set filetype=kotlin
  augroup end
  " augroup _kind
  "   autocmd!
  "   au BufNewFile,BufRead *.kind2 set filetype=kind2
  "   au BufNewFile,BufRead *.kind2 set syntax=javascript
  "   au BufNewFile,BufRead *.kind set filetype=kind
  "   au BufNewFile,BufRead *.kind set syntax=javascript
  "   au BufNewFile,BufRead *.kindelia set filetype=kindelia
  "   au BufNewFile,BufRead *.kindelia set syntax=javascript
  " augroup end
]])

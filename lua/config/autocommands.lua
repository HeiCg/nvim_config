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
  " augroup _auto_resize
  "   autocmd!
  "   autocmd VimResized * tabdo wincmd =
  " augroup end
  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
  augroup _handlebars
    autocmd!
    au BufNewFile,BufRead *.handlebars set filetype=html
    au BufNewFile,BufRead *.handlebars set syntax=html
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

set  rtp+=/Users/matt/Library/Python/3.7/lib/python/site-packages/powerline/bindings/vim

filetype plugin indent on
syntax on
set directory=~/tmp,/var/tmp,/tmp
set laststatus=2
set backspace=2
set relativenumber
set number
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
let mapleader=","
vnoremap <Leader>s :sort<CR>
function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
      return "mac"
    else
      return "linux"
    endif
  endif
endfunction
let os=GetRunningOS()

execute pathogen#infect()

" Turn Spellcheck on
set spell spelllang=en_us

" Close Tag
:let g:closetag_html_style=1 
:source ~/.vim/scripts/closetag.vim 

" Delimitmate
let delimitMate_expand_cr=1

" Scheme
set background=dark
colorscheme hybrid

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|node_modules|dist)$'
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>

" Default tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set textwidth=80

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.h,*.json set softtabstop=4
au BufRead,BufNewFile *.html,*.js,*.jsx,*.jade,*.sass set softtabstop=2

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" JavaScript: 4 spaces
" HTML: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.html,*.js,*.jsx,*.json,*.jade set shiftwidth=2
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=8
        set noexpandtab
    el 
        set shiftwidth=4
        set expandtab
    en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.js,*.jsx,*.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.js,*.jsx,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.js,*.jsx,*.py,*.pyw,*.c,*.h set fileformat=unix

" Keep indentation level from previous line:
set autoindent

" Folding based on indentation: 
set foldmethod=indent

" Javascript
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" ALE
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['pyflakes', 'pydocstyle', 'flake8'],
\   'go': ['golangci_lint', 'golint', 'gofmt', 'govet'],
\   'graphql': ['gqlint'],
\ }

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier', 'tslint'],
\   'typescriptreact': ['prettier', 'tslint'],
\   'less': ['prettier'],
\   'go': ['gofmt', 'goimports'],
\   'python': ['isort', 'black'],
\ }
let g:ale_typescript_eslint_executable = 'eslint_d'
let g:ale_typescript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1

" Makefile
autocmd FileType make setlocal noexpandtab

" Powerline
set showtabline=2
" This allows buffers to be hidden if you've modified a buffer.
set hidden
" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

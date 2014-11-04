source /Users/matt/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
filetype plugin indent on
syntax on
set laststatus=2
set backspace=2
set relativenumber
set nu
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

" Close Tag
:let g:closetag_html_style=1 
:source ~/.vim/scripts/closetag.vim 

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1

" Scheme
"let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
"colorscheme solarized

" Default tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set textwidth=80

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.h,*.json,*.jade set softtabstop=4
au BufRead,BufNewFile *.html,*.js set softtabstop=2

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" JavaScript: 4 spaces
" HTML: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw,*.json,*.jade set shiftwidth=4
au BufRead,BufNewFile *.html,*.js set shiftwidth=2
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
au BufRead,BufNewFile *.js,*.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.js,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.js,*.py,*.pyw,*.c,*.h set fileformat=unix

" Keep indentation level from previous line:
set autoindent

" Folding based on indentation: 
set foldmethod=indent

autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript noremap <buffer> <c-f> : call JsBeautify()<cr>


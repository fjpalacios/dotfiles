" turn on syntax colors
syntax enable
" Monokai colors
let g:molokai_original = 1
" show line numbers
set number
" turn on line wrapping
set wrap
" number of visual spaces per tab
set tabstop=4
" number of spaces in tab when editting
set softtabstop=4
set shiftwidth=4
" turn tabs into spaces
set expandtab
" new lines inherit the identation of previous lines
set autoindent
" highlight parenthesis-like characters
set showmatch
" improve Vim's search option
set incsearch
set hlsearch
" reopen file in the last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

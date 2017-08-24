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
" highlight parenthesis-like characters
set showmatch
" improve Vim's search option
set incsearch
set hlsearch
set ignorecase
set smartcase
" No bells
set belloff=all
" Auto read a file when changed from outside vim
set autoread
" reopen file in the last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
set encoding=utf-8
" Open NERDTree when vim is opened
autocmd vimenter * NERDTree
" Close vim when NERDTree is the last window opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'
" Tree view navigator
Plugin 'scrooloose/nerdtree'
" NERDTree with git highlight
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Twig syntax highlighting
Plugin 'evidens/vim-twig'
" Emmet
Plugin 'mattn/emmet-vim'
" Sublime Text style multiple selectors
Plugin 'terryma/vim-multiple-cursors'
" EditorConfig
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on
" Plugins end

" Custom keyboard shortcuts
" NERDTree
map <S-Right> :tabn<CR>
map <S-Left> :tabp<CR>
map <C-t> :NERDTreeToggle<cr>

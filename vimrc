" Disable vi compatibility mode
set nocompatible
" Increase history size
set history=1000
" Always use unicode
set encoding=utf-8
" Always show what mode are we in
set showmode
" Disable backups
set nobackup
" Disable swap files
set noswapfile
" Turn on syntax colors
syntax enable
" Monokai colors
let g:molokai_original = 1
" Show relative line numbers
set number
set relativenumber
" Turn on line wrapping
set wrap
" Number of visual spaces per tab
set tabstop=4
" Number of spaces in tab when editting
set softtabstop=4
set shiftwidth=4
" Turn tabs into spaces
set expandtab
" Highlight parenthesis-like characters
set showmatch
" Improve Vim's search option
set incsearch
set hlsearch
set ignorecase
set smartcase
" No bells
set belloff=all
" Auto read a file when changed from outside vim
set autoread
" Make backspace work like other apps
set backspace=indent,eol,start
" Reopen file in the last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
set encoding=utf-8
" Close vim when NERDTree is the last window opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'
" NERDTree view navigator
Plugin 'scrooloose/nerdtree'
" NERDTree with git highlight
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Twig syntax highlighting
Plugin 'evidens/vim-twig'
" Emmet
Plugin 'mattn/emmet-vim'
" EditorConfig
Plugin 'editorconfig/editorconfig-vim'
" Buftabline
Plugin 'ap/vim-buftabline'
" Gitgutter
Plugin 'airblade/vim-gitgutter'
" CTRLP
Plugin  'ctrlpvim/ctrlp.vim'

call vundle#end()
filetype plugin indent on
" Plugins end
"
let mapleader=","

" Custom keyboard shortcuts
" NERDTree
map <S-Right> :tabn<CR>
map <S-Left> :tabp<CR>
map <Leader>nt :NERDTreeToggle<cr>
" Buftabline
map <C-N> :bnext<CR>
map <C-P> :bprev<CR>
map <C-B> :bd!<CR>

" Plugins options
" NERDTree
:let g:NERDTreeWinSize=20
" Buftabline
set hidden
" CTRLP
let g:ctrlp_map = '<C-T>'

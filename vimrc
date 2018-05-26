" Disable vi compatibility mode
set nocompatible
" Increase history size
set history=1000
" Always use unicode
set encoding=utf-8
" Disable backups
set nobackup
set nowritebackup
" Disable swap files
set noswapfile
" Turn on syntax colors
syntax on
" Monokai colors
let g:molokai_original = 1
colorscheme molokai
set t_Co=256
" Toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
" Setting visual select-line background color in visual mode
hi Visual cterm=bold ctermbg=Darkgrey
" Highlight current line and column
set cursorline
set cursorcolumn
" Show relative line numbers
set number
set relativenumber
" Turn on line wrapping
set wrap
set tw=79
set colorcolumn=80
" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap
" Number of visual spaces per tab
set tabstop=4
" Number of spaces in tab when editting
set softtabstop=4
set shiftwidth=4
set shiftround
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
" Set OS clipboard by default
set clipboard=unnamed
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
" Powerline statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Syntastic
Plugin 'vim-syntastic/syntastic'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
" Plugins end

" Custom keyboard shortcuts
let mapleader=","
" NERDTree
map <S-Right> :tabn<CR>
map <S-Left> :tabp<CR>
map <Leader>k :NERDTreeToggle<cr>
" Buftabline
map <C-N> :bnext<CR>
map <C-P> :bprev<CR>
map <C-K> :bd!<CR>
" Changing arrow keys to move bewtween split windows in normal mode
noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>

" Plugin settings
" NERDTree
:let g:NERDTreeWinSize=20
" Buftabline
set hidden
" CTRLP
let g:ctrlp_map = '<C-T>'
let g:ctrlp_max_height=30
" Powerline theme
let g:airline_theme='dark'
" Hidding current mode because we are using custom statusbar
set noshowmode
set ttimeoutlen=50
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

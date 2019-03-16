" Automatically install vim-plug if it's not yet installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLso ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
end

" Plugins
call plug#begin('~/.config/nvim/plugged/')

" GUI
Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'

" Syntax
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/echodoc.vim'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Languages
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': ['python'] }
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby'] }
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript'] }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh', 'for': ['typescript'] }

" Tools
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'ap/vim-css-color'

call plug#end()

" Increase history size
set history=1000
" Always use unicode
set encoding=utf-8
" Disable backups
set nobackup
set nowritebackup
set noswapfile
" Show relative line numbers
set number
set relativenumber
" Turn on line wrapping
set wrap
set textwidth=80
set colorcolumn=80
set formatoptions+=t
" Indent settings
set autoindent
set smarttab
set expandtab
set shiftround
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Highlight parenthesis-like characters
set showmatch
" Improve search option
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
" More natural split opening
set splitbelow
set splitright
" Set a map leader for more key combos
let mapleader=','
" Quickly open/reload vim
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" Switch between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Switch between buffers
map <C-N> :bnext<CR>
map <C-P> :bprev<CR>
map <C-C> :bdelete!<CR>
" Clear highlighted search
noremap <space> :noh<CR>
" Remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
" Run tests
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" Turn on syntax colors
syntax on
filetype plugin indent on
set t_Co=256
set termguicolors
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
colorscheme OceanicNext
" Highlight current line and column
set cursorline
set cursorcolumn
" Hide current mode because we are using custom statusbar
set hidden
set noshowmode
set ttimeoutlen=50
" Show extra whitespaces
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)
" Set visual select-line background color in visual mode
hi Visual cterm=bold ctermbg=Darkgrey
" Highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" Airline plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" IndentLine plugin
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
" CtrlP
let g:ctrlp_map = '<c-t>'
let g:ctrlp_show_hidden = 1
" NERDTree
map <Leader>, :NERDTreeToggle<cr>
let NERDTreeShowHidden = 1
" Deoplete
let g:deoplete#enable_at_startup = 1
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END
if has('macunix')
    let g:python_host_prog = '/Users/javi/neovim-env/bin/python'
    let g:python3_host_prog = '/Users/javi/neovim-env/bin/python3'
    let g:ale_python_pycodestyle_executable = '/Users/javi/neovim-env/bin/pycodestyle'
    let g:ale_python_flake8_executable = '/Users/javi/neovim-env/bin/flake8'
    let g:ale_python_pylint_executable = '/Users/javi/neovim-env/bin/pylint'
    let g:ale_python_autopep8_executable = '/Users/javi/neovim-env/bin/autopep8'
else
    let g:python_host_prog = '/home/javi/neovim-env/bin/python'
    let g:python3_host_prog = '/home/javi/neovim-env/bin/python3'
    let g:ale_python_pycodestyle_executable = '/home/javi/neovim-env/bin/pycodestyle'
    let g:ale_python_flake8_executable = '/home/javi/neovim-env/bin/flake8'
    let g:ale_python_pylint_executable = '/home/javi/neovim-env/bin/pylint'
    let g:ale_python_autopep8_executable = '/home/javi/neovim-env/bin/autopep8'
endif
" Echodoc
let g:echodoc_enable_at_startup = 1
" Supertab
let g:SuperTabDefaultCompletionType = '<c-n>'
" Ultisnips
let g:UltiSnipsExpandTrigger = '<c-s>'
let g:UltiSnipsJumpForwardTrigger = '<c-s>'
" Ale
let g:ale_linters = {
  \ 'python': ['pycodestyle', 'flake8', 'pylint'] ,
  \ 'typescript': ['tsserver'] ,
  \ }
let g:ale_fixers = {
  \  'python': ['yapf', 'autopep8'],
  \  'ruby': ['rubocop'],
  \  'javascript': ['prettier', 'eslint'],
  \  'typescript': ['prettier', 'tsserver'],
  \}
" Javascript
let g:javascript_plugin_jsdoc = 1

" Make reserved keywords and comments italic
highlight htmlArg cterm=italic term=italic gui=italic
highlight xmlAttrib cterm=italic term=italic gui=italic
highlight Comment cterm=italic term=italic gui=italic
highlight Statement cterm=italic term=italic gui=italic
highlight Conditional cterm=italic term=italic gui=italic
highlight Repeat cterm=italic term=italic gui=italic
highlight Label cterm=italic term=italic gui=italic
highlight Operator cterm=italic term=italic gui=italic
highlight Keyword cterm=italic term=italic gui=italic
highlight Exception cterm=italic term=italic gui=italic
highlight PreProc cterm=italic term=italic gui=italic
highlight Include cterm=italic term=italic gui=italic
highlight Define cterm=italic term=italic gui=italic
highlight Macro cterm=italic term=italic gui=italic
highlight PreCondit cterm=italic term=italic gui=italic
highlight Type cterm=italic term=italic gui=italic
highlight StorageClass cterm=italic term=italic gui=italic
highlight Structure cterm=italic term=italic gui=italic
highlight Typedef cterm=italic term=italic gui=italic
highlight Special cterm=italic term=italic gui=italic
highlight SpecialChar cterm=italic term=italic gui=italic
highlight Tag cterm=italic term=italic gui=italic
highlight Delimiter cterm=italic term=italic gui=italic
highlight SpecialComment cterm=italic term=italic gui=italic
highlight Debug cterm=italic term=italic gui=italic
highlight Todo cterm=italic term=italic gui=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug autoinstaller
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLso ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged/')
" GUI
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
" Syntax
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim'
Plug 'saltstack/salt-vim'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
" Tools
Plug 'alvan/vim-closetag'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'KabbAmine/vCoolor.vim'
Plug 'mattn/calendar-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'zivyangll/git-blame.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Increase history size
set history=1000
" Always use unicode
set encoding=utf-8
" Disable backups
set nobackup
set nowritebackup
set noswapfile
" Persist undo history between file editing sessions.
set undofile
set undodir=~/.config/nvim/undodir
" Show relative line numbers
set number relativenumber
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
" Turn on syntax colors
syntax on
filetype plugin indent on
set t_Co=256
set termguicolors
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
" Highlight current line and column
set cursorline
set cursorcolumn
" Hide current mode because we are using custom statusbar
set hidden
set noshowmode
set ttimeoutlen=50
" Folding with ease
set foldmethod=indent
set foldlevel=1
set nofoldenable
" Show extra whitespaces
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)
" Set visual select-line background color in visual mode
highlight Visual cterm=bold ctermbg=Darkgrey
" Highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" Enable mouse wheel
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set a map leader for more key combos
let mapleader=','
" Quickly open/reload vim config
nmap <Leader>ev :vsplit $MYVIMRC<CR>
nmap <Leader>sv :source $MYVIMRC<CR>
" Switch between split windows
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>
" Switch between buffers
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprev<CR>
nmap <C-c> :bdelete!<CR>
" Clear highlighted search
nmap <Leader>/ :noh<CR>
" EasyMotion movement
map <Space> <Plug>(easymotion-overwin-f2)
" Remove extra whitespace
nmap <Leader><Space> :%s/\s\+$<CR>
" Run tests
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" Format selected region
vmap <Leader>fs <Plug>(coc-format-selected)
nmap <Leader>fs <Plug>(coc-format-selected)
" Format file
nmap <Leader>ff :Format<CR>
" Do codeAction of current line
nmap <Leader>ac <Plug>(coc-codeaction)
" Do codeAction of selected region
xmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>a <Plug>(coc-codeaction-selected)
" Select selections ranges
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
" Fix problem of current line
nmap <Leader>qf <Plug>(coc-fix-current)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Rename current word
nmap <F2> <Plug>(coc-rename)
" Show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" NERDTree
nmap <Leader>nn :NERDTreeToggle<CR>
nmap <Leader>nb :NERDTreeFromBookmark
nmap <Leader>nf :NERDTreeFind<CR>
" Switch relative numbers
nmap <Leader>rn :set invrelativenumber<CR>
" Easy save
nmap <Leader>w :update<CR>
nmap <Leader>W :wa<CR>
" Markdown preview
nmap <Leader>mp <Plug>MarkdownPreviewToggle
" fzf
nmap <Leader>f :Files<CR>
nmap <Leader>t :Rg<Space>
nmap <Leader>h :History<CR>
nmap <Leader>b :Buffers<CR>
" Fugitive
nmap <Leader>gd :Gvdiffsplit!<CR>
nmap gdh :diffget //2 <bar> diffupdate<CR>
nmap gdl :diffget //3 <bar> diffupdate<CR>
" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Git Blame
nmap <Leader>s :call gitblame#echo()<CR>
" Move faster up/down blocks of selected text
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv
" Align GitHub-flavored Markdown tables
vmap <Leader><Bar> :EasyAlign*<Bar><Enter>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins' config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let airline#extensions#ale#error_symbol = ' '
let airline#extensions#ale#warning_symbol = ' '
" IndentLine plugin
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
" NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^node_modules$', '.git']
" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
" VCoolor
let g:vcoolor_lowercase = 1
let g:vcoolor_map = '<C-g>'
" Coc
let g:coc_global_extensions = [
  \ 'coc-html', 'coc-css', 'coc-json', 'coc-prettier', 'coc-emmet', 'coc-snippets',
  \ 'coc-angular', 'coc-highlight', 'coc-python', 'coc-solargraph', 'coc-vetur',
  \ 'coc-phpls', 'coc-docker', 'coc-tsserver'
  \ ]
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 Format :call CocAction('format')
" Ale
let g:ale_linters = {
  \ 'python': ['pycodestyle', 'flake8', 'pylint'] ,
  \ 'typescript': ['eslint'] ,
  \ 'javascript': ['prettier', 'eslint', 'xo'],
  \ 'scss': ['stylelint'],
  \ 'css': ['stylelint'],
  \ 'go': ['gopls'],
  \ }
let g:ale_fixers = {
  \  'python': ['yapf', 'autopep8'],
  \  'ruby': ['rubocop'],
  \  'javascript': ['prettier', 'eslint'],
  \  'typescript': ['prettier', 'eslint'],
  \  'scss': ['stylelint'],
  \  'css': ['stylelint'],
  \  'go': ['gofmt', 'goimports'],
  \  'terraform': ['terraform'],
  \}
let g:ale_fix_on_save = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:python_host_prog = expand('~/.pyenv/versions/neovim-python2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim-python3/bin/python3')
let g:ale_python_pycodestyle_executable = expand('~/.pyenv/versions/neovim-python3/bin/pycodestyle')
let g:ale_python_flake8_executable = expand('~/.pyenv/versions/neovim-python3/bin/flake8')
let g:ale_python_pylint_executable = expand('~/.pyenv/versions/neovim-python3/bin/pylint')
let g:ale_python_autopep8_executable = expand('~/.pyenv/versions/neovim-python3/bin/autopep8')
autocmd FileType python let b:coc_root_patterns = ['setup.py', 'env', 'requirements.txt']
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
" fzf
set rtp+=/usr/local/opt/fzf
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
" vim-go
let g:go_def_mapping_enabled = 0
" Resolve properly Vue relative paths
set includeexpr=substitute(v:fname,'\\~','.','g')
" Vimwiki
let g:vimwiki_list = [
  \{
  \  'path': '~/Notes',
  \  'syntax': 'markdown',
  \  'ext': '.md',
  \  'auto_diary_index': 1,
  \}
\]
autocmd BufNewFile ~/Notes/**/diary/*-*-*.md :silent 0r !~/.config/nvim/vimwiki-diary-template '%'
autocmd BufNewFile ~/Notes/**/task-*.md :silent 0r !~/.config/nvim/vimwiki-task-template '%'
" Calendar
let g:calendar_monday = 1
" Filetypes reassignment
autocmd BufRead,BufNewFile *.tf set filetype=terraform
autocmd BufRead,BufNewFile *.tfvars set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate set filetype=json
autocmd BufRead,BufNewFile *.tfstate.backup set filetype=json
autocmd BufRead,BufNewFile *.map set filetype=yaml

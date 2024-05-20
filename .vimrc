" Vim configuration file "
syntax enable
set mouse=a
set number
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set showmatch

" Vim plug
call plug#begin('~/.vim/plugged')

Plug 'haishanh/night-owl.vim'

call plug#end()

" Colorscheme
if !has("gui_running")
    set t_Co=256
endif

if (has("termguicolors"))
 set termguicolors
endif

colorscheme night-owl
let g:lightline = { 'colorscheme': 'nightowl' }

" Remove trailing whitespace from Python files
autocmd BufWritePre *.py :%s/\s\+$//e

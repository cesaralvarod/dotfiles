" General sets

syntax on
set mouse=a
set noerrorbells
set sw=2
set clipboard=unnamed
set tabstop=2
set expandtab
set smartindent
set smartcase
set numberwidth=1
set number
set relativenumber
set nowrap
set noswapfile
set incsearch
set encoding=utf-8
set ignorecase
set cursorline
set splitbelow
set splitright
set showcmd
set showmatch
set ruler
set laststatus=2
set nobackup
set pastetoggle=<F2>
set updatetime=300
set undofile
set undodir=~/.vim/undodir
set nowritebackup
set signcolumn=yes

filetype on
filetype plugin on
filetype indent on

let g:netrw_liststyle=3

so ~/.config/nvim/plugins.vim
so ~/.config/nvim/config-plugins.vim
so ~/.config/nvim/maps.vim

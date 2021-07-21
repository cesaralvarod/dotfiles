"Plugins

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lilydjwg/colorizer'
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'burnettk/vim-angular'
Plug 'rhysd/vim-clang-format'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'frazrepo/vim-rainbow'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'preservim/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-python/python-syntax'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'justmao945/vim-clang'
Plug 'tmhedberg/matchit'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'KabbAmine/vCoolor.vim'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'tomoyukikashiro/vim-angular-snippets'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'Galooshi/vim-import-js'
Plug 'StanAngeloff/php.vim'

call plug#end()

"General sets

syntax on
set mouse=a
set noerrorbells
set sw=2
set clipboard=unnamed
set tabstop=2
set expandtab
set smartindent
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
set splitright
set splitbelow

filetype on
filetype plugin on
filetype indent on
let mapleader=" "

let g:netrw_liststyle=3

nnoremap <leader>w :Prettier<CR>:w<CR>
nnoremap <leader>q :Prettier<CR>:wq<CR>
nnoremap <leader>qq :q!<CR>

nnoremap <leader>t :ter<CR>

noremap <leader>k :bnext<CR>
noremap <leader>j :bprevious<CR>
noremap <leader>0 :bdelete<CR>

" Cursor

let &t_SR = "\033]12;199\x7\e[3 q"
let &t_SI = "\033]12;199\x7\e[5 q"
let &t_EI = "\033]12;white\x7\e[1 q"

augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\033]12;white\x7\e[1 q"
augroup END

" Coc

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Theme

colorscheme purify
set background=dark
" hi Normal guibg=#222834 ctermbg=236
let g:purify_override_colors = {
      \'pink':  { 'gui': '#FF87FF', 'cterm': '213' },
      \'green': { 'gui': '#5FD700', 'cterm': '76' }
      \}


" NerdTree

nmap nt :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeFileMatchHighlightFullName=1
let g:NERDTreePatternExtensionHighlightFullName=1

" COC
let g:coc_disable_startup_warning = 1

" Prettier

let g:prettier#autoformat_require_pragma=0
let g:prettier#quickfix_enabled=0

" Airline

let g:airline_powerline_fonts=1
let g:airline_theme='purify'

" Clang format

autocmd FileType c, cpp, java, typescript, c#  ClangFormatAutoEnable
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

" " Vim rainbow

au FileType typescript,json,python,javascript,cs,c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'blue']

" Nerd Comments

let g:NERDSpaceDelims = 1

" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%* 

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Auto pairs

au FileType html let b:AutoPairs = AutoPairsDefine({'<' : '>'})
au FileType php let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})

" Ale

let b:ale_warn_about_trailing_whitespace = 0
let g:ale_list_window_size = 5
let g:ale_set_quickfix = 1
let g:ale_fixers={'*':[],  'html':['prettier'], 'python':['autopep8']}
let g:ale_linters={'python':['flake8'], 'typescript':['typescript-eslint']}

" Vim python

let g:python_highlight_all = 1

" Ident html on php

function IdentPHPHTML()
  set ft=html
  normal gg=G
  set ft=php
endfunction

nnoremap <leader>ip <CR>:call IdentPHPHTML()<CR>:w<CR>

call plug#begin('~/.vim/plugged')

Plug 'simrat39/lsp-trouble.nvim'
Plug 'folke/lsp-colors.nvim'

Plug 'applejwjcat/dashboard-nvim'

" Syntax

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot' " Diferent languages
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'burnettk/vim-angular'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'justmao945/vim-clang'
Plug 'plasticboy/vim-markdown'
Plug 'Galooshi/vim-import-js'
Plug 'tomlion/vim-solidity'
Plug 'dsawardekar/wordpress.vim'
Plug 'digitaltoad/vim-pug'
Plug 'jparise/vim-graphql'
Plug 'vim-python/python-syntax'
Plug 'yuezk/vim-js'
Plug 'mxw/vim-jsx' " JSX highlight
Plug 'maxmellon/vim-jsx-pretty' " Tabs JSX -- La estoy probando
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'rust-lang/rust.vim'
Plug 'tellijo/vim-react-native-snippets'


Plug 'metakirby5/codi.vim'

" Status bar

Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lualine/lualine.nvim'	" Lualine

" Themes

Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'drewtempelmeyer/palenight.vim'

" Tree
Plug 'nanozuki/tabby.nvim'
" Plug 'scrooloose/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Icons

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Typing

Plug 'jiangmiao/auto-pairs' " Autoclose pairs
Plug 'alvan/vim-closetag' " Autoclose tags
Plug 'tpope/vim-surround' " Lets select text to enclose in (), [], {}
Plug 'tomtom/tcomment_vim' " Add comments

" Tmux

Plug 'christoomey/vim-tmux-navigator'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'romgrk/barbar.nvim'

" Autocomplete

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'tomoyukikashiro/vim-angular-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'mattn/emmet-vim'

" Test

Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

" IDE

Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'
Plug 'lilydjwg/colorizer'
Plug 'frazrepo/vim-rainbow' " ()[]{} with colors
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-eunuch'
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multiple cursors
Plug 'lewis6991/gitsigns.nvim'
Plug 'rcarriga/nvim-notify'

" Telescope

Plug 'nvim-lua/plenary.nvim' " Complement for nvim-telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" Format

Plug 'rhysd/vim-clang-format'
Plug 'prettier/vim-prettier', {'do': 'npm install'}

" Errors

Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'jaxbot/semantic-highlight.vim'

" Git

Plug 'airblade/vim-gitgutter'

" Others

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim' " Color indent

call plug#end()

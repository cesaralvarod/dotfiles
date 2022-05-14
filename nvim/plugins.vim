call plug#begin('~/.vim/plugged')

" Syntax

Plug 'sheerun/vim-polyglot'
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
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Status bar

Plug 'vim-airline/vim-airline'

" Themes

Plug 'kyoz/purify', { 'rtp': 'vim' }

" Tree

Plug 'scrooloose/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Typing

Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround' " Lets select text to enclose in (), [], {}

" Tmux

Plug 'christoomey/vim-tmux-navigator'

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
Plug 'nvim-lua/plenary.nvim' " Complement for nvim-telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'
Plug 'lilydjwg/colorizer'
Plug 'frazrepo/vim-rainbow'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-eunuch'

" Format

Plug 'rhysd/vim-clang-format'
Plug 'prettier/vim-prettier', {'do': 'npm install'}

" Errors

Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'jaxbot/semantic-highlight.vim'

" Git

Plug 'airblade/vim-gitgutter'

call plug#end()


lua << END
require('lualine').setup{
 options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
	  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  }
}


require("bufferline").setup{
  options={
    mode = "tabs",
    diagnostics = "nvim_lsp",
    view={
      adaptive_size =false
    }
  }
}
END

lua << EOF
  require("trouble").setup {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  }
EOF

lua << EOF

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

EOF

lua << EOF

require("nvim-treesitter.configs").setup {
  highlight={
    enable=true,
  }
}

EOF



" Colorear Tag en JS

let g:vim_jsx_pretty_highlight_close_tag = 1

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

" Theme

let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "nerdtree", "vista_kind", "terminal" ]
let g:tokyonight_style = 'storm'

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme tokyonight 
let g:palenight_terminal_italics=1

" colorscheme purify
" set background=dark
" " hi Normal guibg=#222834 ctermbg=236
" let g:purify_override_colors = {
      " \'pink':  { 'gui': '#FF87FF', 'cterm': '213' },
      " \'green': { 'gui': '#5FD700', 'cterm': '76' }
      " \}


" NerdTree

let NERDTreeQuitOnOpen=1
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeFileMatchHighlightFullName=1
let g:NERDTreePatternExtensionHighlightFullName=1

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" COC
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-prettier', 'coc-snippets']
let g:coc_snippet_next = '<tab>'

" Prettier

let g:prettier#autoformat_require_pragma=0
let g:prettier#quickfix_enabled=0

" Airline

" let g:airline_powerline_fonts=1
" let g:airline_theme='purify'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_left_sep = " "
" let g:airline_right_sep = " "


" Clang format

autocmd FileType c, cpp, java, typescript, c#  ClangFormatAutoEnable
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

" Vim rainbow

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
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Auto pairs

au FileType html let b:AutoPairs = AutoPairsDefine({'<' : '>'})
au FileType php let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})

" Ale

let b:ale_warn_about_trailing_whitespace = 0
let g:ale_list_window_size = 5
let g:ale_set_quickfix = 1

let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_info_str = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers={'*':['prettier'], 'python':['autopep8']}
let g:ale_linters={'typescript':['typescript-eslint'], 'css':['eslint'], 'javascript': ['prettier-eslint', 'eslint'], 'json':['eslint'] }
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'

" Vim python

let g:python_highlight_all = 1

" gitgutter

let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
" let g:gitgutter_sign_removed_above_and_below = ''
let g:gitgutter_sign_modified_removed = ''

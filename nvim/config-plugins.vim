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

colorscheme purify
set background=dark
" hi Normal guibg=#222834 ctermbg=236
let g:purify_override_colors = {
      \'pink':  { 'gui': '#FF87FF', 'cterm': '213' },
      \'green': { 'gui': '#5FD700', 'cterm': '76' }
      \}


" NerdTree

let NERDTreeQuitOnOpen=1
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeFileMatchHighlightFullName=1
let g:NERDTreePatternExtensionHighlightFullName=1

" COC
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-prettier', 'coc-snippets']

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
let g:ale_sign_info = 'כֿ'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_info_str = 'כֿ'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers={'*':['prettier'], 'python':['autopep8']}
let g:ale_linters={'typescript':['typescript-eslint'], 'css':['eslint'], 'javascript': ['prettier-eslint', 'eslint'], 'json':['eslint'], }
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

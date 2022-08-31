let mapleader=" "

" Buffer

nmap <c-e> :bn<CR>
nmap <c-d> :bd<CR>

" Ventana doble

nnoremap <c-z> :vsp<CR>
inoremap <C-z> <c-o>:vsp<CR>

" General

nnoremap <leader>w :ALEFix<CR>:w<CR>
nnoremap <leader>q :ALEFix<CR>:wq<CR>
nnoremap <leader>qq :q!<CR>

"Atajo para guardar archivos
"ct+s guardar un solo archivo
"ct+a guardar todos los archivos

nmap <c-s> :w<CR> 
imap <c-s> <c-o>:w<CR>
nmap <c-a> :wa<CR>
imap <c-a> <c-o>:wa<CR>


nnoremap <leader>t :ter<CR>

noremap <leader>k :bnext<CR>
noremap <leader>j :bprevious<CR>
noremap <leader>0 :bdelete<CR>

" Add ; to end of line

noremap <leader>; $a;<Esc><CR>

" Split resize Tmux

noremap <leader>> 10<C-w><<CR>
noremap <leader>< 10<C-w>><CR>

" Faster scrolling

nnoremap J 10<C-e>
nnoremap K 10<C-y>

" NerdTree

nmap nt :NERDTreeToggle<CR>

cnoreabbrev tree NERDTreeToggle

" Telescope

nmap ff :Telescope find_files<CR>
nmap fg :Telescope live_grep<CR>
nmap fb :Telescope buffers<CR>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" Easymotion

nmap <leader>f <Plug>(easymotion-overwin-f2)

" Coc

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Open javascript file with node

nnoremap <leader>x :!node %<CR>

" Open a terminal

set splitright

function! OpenTerminal()
  " Move to right most buffer
  execute "normal \<C-1>"
  execute "normal \<C-1>"
  execute "normal \<C-1>"
  execute "normal \<C-1>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "%buftype", "not found")

  if bufType == "terminal"
    " Close existing terminal
    execute "q"
  else
    " Open terminal
    execute "vsp term://fish"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n><C-w>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!

  endif
endfunction

nnoremap <C-t> :call OpenTerminal()<CR>

" Atajo para llamar a la terminal bash

nmap <C-c> :sp term://bash<CR>
nmap <C-x> :vsp term://bash<CR>


tnoremap <Esc> <C-\><C-n>

"cambiar entre paneles
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

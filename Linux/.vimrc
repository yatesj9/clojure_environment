execute pathogen#infect()
syntax on
filetype plugin indent on

" TSlime Vim
let g:lisp_rainbow=1
let g:slimv_repl_syntax=1

let g:slime_target = "screen"
let g:slime_target = "tmux"

map <C-q> :mksession! ~/.vim/.session <cr>
map <C-//> map ,# :s/^/#/<CR>
map <S-//> :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR><Esc>:nohlsearch<CR>
imap <M-Up> :tabn<CR>
imap <M-Down> :tabp<CR>
imap <c-s> <esc><c-s>
autocmd BufWritePre * :%s/\s\+$//e "delete whitespace before save


autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
autocmd BufRead,BufNewFile *.cljc setlocal filetype=clojure


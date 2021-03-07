call pathogen#runtime_append_all_bundles()
syntax on
filetype off
filetype plugin indent on " Enable filetype-specific indenting and plugins
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
autocmd BufRead,BufNewFile *.cljc setlocal filetype=clojure

set shiftwidth=2
" autocmd FileType c,cpp,java,javascript,python,xml,xhtml,html set shiftwidth=2

augroup filetypedetect
  au! BufNewFile,BufRead *.ch setf cheat
augroup END

" Load matchit (% to bounce from do to end, etc.)
runtime! plugin/matchit.vim
runtime! macros/matchit.vim
set nonumber

set noswapfile
set nobackup
set nowb

set nocompatible          " We're running Vim, not Vi!
set guitablabel=%M%t
set nobackup
set nowritebackup
set path=$PWD/public/**,$PWD/**
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set guioptions-=m
set laststatus=2

map <C-q> :mksession! ~/.vim/.session <cr>
map <C-//> map ,# :s/^/#/<CR>
map <S-//> :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR><Esc>:nohlsearch<CR>
imap <M-Up> :tabn<CR>
imap <M-Down> :tabp<CR>
imap <c-s> <esc><c-s>
autocmd BufWritePre * :%s/\s\+$//e "delete whitespace before save

colorscheme solarized
set guioptions-=T
if has("gui_running")
  set background=dark
  set gfn=Droid\ Sans\ Mono\ Slashed:h13
  set fu
  set go-=L "hide the left-scrollbar when V split
  set go-=r "as above for right
  "set columns=200
  set fuopt+=maxhorz
else
  set t_Co=256
  let g:CSApprox_loaded=1
endif

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
augroup END

nmap <silent> <Leader>p :NERDTreeToggle<CR>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>
nnoremap <C-B> :BufExplorer<cr>

"make Y consistent with C and D
nnoremap Y y$

set cursorline
if exists('+colorcolumn')
  set colorcolumn=81
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" Formatting
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" gvim specific
set mousehide  " Hide mouse after chars typed

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal g`\""
        endif
    end
endfunction

"define :HighlightExcessColumns command to highlight the offending parts of
"lines that are "too long". where "too long" is defined by &textwidth or an
"arg passed to the command
command! -nargs=? HighlightExcessColumns call s:HighlightExcessColumns('<args>')
function! s:HighlightExcessColumns(width)
    let targetWidth = a:width != '' ? a:width : &textwidth
    if targetWidth > 0
        exec 'match Todo /\%>' . (targetWidth+1) . 'v/'
    else
        echomsg "HighlightExcessColumns: set a &textwidth, or pass one in"
    endif
endfunction

" CTRL-Z undoes even in visual/selection mode
vnoremap <C-Z> <C-C>


" TSlime Vim
let g:lisp_rainbow=1
let g:slimv_repl_syntax=1

"Gundo
nnoremap <F5> :GundoToggle<CR>

" CtrlP
" Set this to 1 to set searching by filename (not full path) as the default:
" Set to 0 to search by full path
let g:ctrlp_by_filename = 1
" Disable buffer jumping
let g:ctrlp_switch_buffer = 0
" Do not manage the working directory
let g:ctrlp_working_path_mode = 0
" Don't scan for dot files
let g:ctrlp_dotfiles = 0

" let g:closetag_filenames = '*.js, *.jsx, *.clj, *.cljs'

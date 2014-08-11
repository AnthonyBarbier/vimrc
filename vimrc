" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
"Use 256 colors
set t_Co=256
"Program called when 'make' is called
set makeprg=./build.sh
"set makeprg=make

exe "silent ! mkdir -p  .vim_cache"
set directory=.vim_cache,~/tmp/vim,~/tmp,/tmp

"auto completion for files
set wildmenu
"set wildignore=*.bak,*.o,*.e,*~ " Wildmenu: ignore these extensions.
set wildmode=longest:list,full 

"Auto completion mode for commands
set completeopt=longest,menu,preview

set shell=/bin/bash
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history

set shiftwidth=4
set tabstop=4

"set ruler		" show the cursor position all the time
" As above, but with buffer number preceeding usual info
"set statusline=%-0n\ %<%f\ %h%m%r%=%-14.(%l, %c%V%)\ %P
set laststatus=2	" Always show statusline, if there's only one window
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set splitright		" Horizontal splits should put the new window BELOW
set splitbelow		" Vertical splits should put the new window RIGHT
set spelllang=en_gb	" Proper English ;-)
set dir-=.	" Remove the current directory from the list of places to keep swap files. This makes SVN usage a lot
		" cleaner
set fileformats=unix,dos,mac	" Enable autodetection of newline formats
set list lcs=tab:¬.,trail:#

"set complete=.,w,b,u,t,i
set complete=.,w,b,u,t
"tag files
"set tags +=$HOME/.vim/tags/project.ctags

" Default encoding should be Unicode
set encoding=utf8

" c: Comment auto-wrap
" w: Whitespace indicators at end of line
" q: gq uses these settings
" n: Number lists should change indent
" a: Auto paragraph reflow
set formatoptions=cwqna

" PuTTY does odd things with arrow keys
map <ESC>[A <C-Up>
map <ESC>[B <C-Down>
map <ESC>[C <C-Right>
map <ESC>[D <C-Left>

" Fix-up keycodes
" PuTTY in XTermR6 mode
set <F1>=OP
set <F2>=OQ
set <F3>=OR
set <F4>=OS
set <F5>=[15~
set <F6>=[17~
set <F7>=[18~
set <F8>=[19~
set <F9>=[20~
set <F10>=[21~
set <F11>=[23~
set <F12>=[24~

" NB: S-F1 == F11, so S-F1 is probably unreachable
" NB: S-F2 == F12, so S-F2 is probably unreachable
set <S-F1>=[23~
set <S-F2>=[24~
set <S-F3>=[25~
set <S-F4>=[26~
set <S-F5>=[28~
set <S-F6>=[29~
set <S-F7>=[31~
set <S-F8>=[32~
set <S-F9>=[33~
set <S-F10>=[34~
set <S-F11>=[23~
set <S-F12>=[24~


"1

" Disable forced-sync of file-writes, to avoid blocking while we wait for disk
" I/O (or spinning up the disk on laptops)
"set nofsync
set swapsync=

syntax on
set hlsearch
set showmatch

"colorscheme desert
colorscheme nature
"colorscheme 256-jungle


 " Enable file type detection.
 " Use the default filetype settings, so that mail gets 'tw' set to 72,
 " 'cindent' is on in C files, etc.
 " Also load indent files, to automatically do language-dependent indenting.
 filetype plugin indent on
 set guifont=Liberation\ Mono\ 8
   if has("win32")
	"set guifont=DejaVu_Sans_Mono:h12:cANSI, Consolas:h13:cANSI
	set dir+=$TEMP
    else
	"set guifont=DejaVu\ Sans\ Mono\ 11,\ Monospace\ 11
    endif


set scrolloff=6     " Keep some lines above/below the cursor visible

"set mouse=r
set mouse=ar
set ttymouse=xterm2 " Works under GNU Screen
"set go -=m
"set go -=T
"set go -=r

au BufNewFile, BufRead SCons* set filetype=scons

set number
set hidden
set cindent
set formatoptions+=r
filetype plugin on
"set comments=s1:/*, mb:\ *, elx:\ */
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <F12> :BufExplorer<CR>
" Previous / next line in quickwindow
nnoremap <silent> <F2> :cp<CR>
nnoremap <silent> <F3> :cn<CR>
" Jump to line selected in quickwindow
nnoremap <silent> <F4> :exe "cc".line('.')<CR>
" Jump to quickwindow line when double clicking on a line in the quickwindow
nnoremap <2-LeftMouse> :exe "cc".line('.')<CR>
" Pull / push a change from current buffer when in diff mode
nnoremap <silent> <F5> :.,.diffget<CR>:diffupdate<CR>]c
nnoremap <silent> <F6> :.,.diffput<CR>:diffupdate<CR>]c
"Search / replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
"Search for word under cursor in all the source code files
nnoremap <Leader>f :FindCode <C-r><C-w> .
"Search for word under cursor in all files
nnoremap <Leader>a :FindAny <C-r><C-w> .
"Move half page up / down
nnoremap <C-n> <C-u>
nnoremap <C-m> <C-d>
"Resize windows
nnoremap <silent> + :exe "vertical resize " . (winwidth(0) * 10/9)<CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 9/10)<CR>
nnoremap <Leader>+ :exe "resize " . (winheight(0) * 10/9)<CR>
nnoremap <Leader>- :exe "resize " . (winheight(0) * 9/10)<CR>
nnoremap <F10> :wa<CR>:make<CR>

function! CD()
  if bufname("") !~ "^ftp://"
    lcd %:p:h
  endif
endfunction
nnoremap <silent> <F9> :call CD()<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

function! FindAnyFunc( expr, path )
	exe "!grep -R -n ". a:expr." ". a:path." | grep -v \"\.svn/*\" > .vim_cache/grep_output.log"
	exe "cfile .vim_cache/grep_output.log"
	exe "copen"
endfunction

function! FindCodeFunc( expr, path )
	exe "!grep -R -n --include=*.c --include=*.cpp --include=*.cl --include=*.h --include=*.hpp \"". a:expr."\" ". a:path." | grep -v \"\.svn/*\" > .vim_cache/grep_output.log"
	exe "cfile .vim_cache/grep_output.log"
	exe "copen"
endfunction

function! FindHexFunc( expr, path )
	exe "!grep -R -n --include=*.hex ". a:expr." ". a:path." | grep -v \"\.svn/*\" > .vim_cache/grep_output.log"
	exe "cfile .vim_cache/grep_output.log"
	exe "copen"
endfunction
function! CopenFunc()
	exe "cfile .vim_cache/scons_output.log"
	exe "copen"
endfunction

command! -nargs=0 Copen call CopenFunc()
command! -nargs=* Ctags !ctags -R -a <f-args>
command! -nargs=* FindCode call FindCodeFunc(<f-args>)
command! -nargs=* FindAny call FindAnyFunc(<f-args>)
command! -nargs=* FindHex call FindHexFunc(<f-args>)
command! -nargs=1 Open call Open(<args>)
command! -nargs=1 Diff :vertical diffpatch <f-args>
command! -nargs=0 Wsudo :w !sudo tee > /dev/null %

set nocst "no ctags db
set cscopequickfix=s-,c-,d-,i-,t-,e-
let GtagsCscope_Auto_Load = 1
"Disabled because uses F-<> keys
let GtagsCscope_Auto_Map = 0
let GtagsCscope_Quiet = 1
set cscopetag
set statusline=[%f][%l,%v][%p%%][len=%L]

" g = definition
" c = references
" t = string
" e = reg exp (egrep)
" s = symbol
" d = functions called (not implemented)
" f = find file
" i = find files which include file
" normal command
":nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>d :cs find g <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>r :cs find c <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
":nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
:nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
:nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
":nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"
command! -nargs=* -complete=custom,GtagsCandidate Zdef :cs find g <args>
command! -nargs=* -complete=custom,GtagsCandidate Zfind :cs find t <args>
command! -nargs=* -complete=custom,GtagsCandidate Zgrep :cs find e <args>
command! -nargs=* -complete=custom,GtagsCandidate Zsymbol :cs find s <args>
command! -nargs=* -complete=custom,GtagsCandidate Zfile :cs find f <args>
command! -nargs=* -complete=custom,GtagsCandidate Zinclude :cs find i <args>

"Create a bookmark for the current cursor with the word under the cursor as id
:nmap <Leader>b :Bookmark <C-R>=expand("<cword>")<CR>

"Open .cl files as C files
au BufNewFile,BufRead *.cl set filetype=c

"Make ctrlp browse buffers instead of files by default
let g:ctrlp_cmd='CtrlPBuffer'
let g:EasyMotion_leader_key = '<Tab>'

"Load pathogen as a module (Pathogen will then load all the other modules
source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
"Use 256 colors
set t_Co=256
"Program called when 'make' is called
set makeprg=./build.sh
"set makeprg=make

"FIXME: needs a more recent version of vim!
func ActivateEnv(cmd)
  echomsg "GDB ".a:cmd
  return ". activate_buildenv.sh; enable.sh ;".a:cmd
endfunc
let g:termdebug_config = {}
let g:termdebug_config["command_filter"] = function("ActivateEnv")
packadd termdebug

let s:home = expand('~')
let s:cache= s:home . "/tmp/vim_cache" . getcwd()
exe "silent ! mkdir -p ". s:cache
let &directory=s:cache . "," . s:home . "/tmp/vim_cache"
let &undodir=s:cache
set undofile
set undolevels=1000
set undoreload=10000
set termwinscroll=100000
set ttyfast

"auto completion for files
set wildmenu
"set wildignore=*.bak,*.o,*.e,*~ " Wildmenu: ignore these extensions.
set wildmode=longest:list,full

"Auto completion mode for commands
set completeopt=longest,menu,preview

set shell=/bin/bash
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=200  " keep 200 lines of command line history

set expandtab
" ACL
"set shiftwidth=4
"set tabstop=4
" Google V8
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab

"set ruler   " show the cursor position all the time
" As above, but with buffer number preceeding usual info
"set statusline=%-0n\ %<%f\ %h%m%r%=%-14.(%l, %c%V%)\ %P
set laststatus=2    " Always show statusline, if there's only one window
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set splitright      " Horizontal splits should put the new window BELOW
set splitbelow      " Vertical splits should put the new window RIGHT
set spelllang=en_gb " Proper English ;-)
set dir-=.          " Remove the current directory from the list of places to keep swap files. This makes SVN usage a lot
                    " cleaner
set fileformats=unix,dos,mac " Enable autodetection of newline formats
set list lcs=tab:~.,trail:#
cabbr <expr> %% expand('%:p:h')

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
set formatoptions=wqn

" PuTTY does odd things with arrow keys
map <ESC>[A <C-Up>
map <ESC>[B <C-Down>
map <ESC>[C <C-Right>
map <ESC>[D <C-Left>
" Screen messes up Home / End
map <ESC>[H <Home>
imap <ESC>[H <Home>
map <ESC>[F <End>
imap <ESC>[F <End>
map <ESC>[7~ <Home>
map <ESC>[4~ <End>

":verbose map /
"nunmap /
"nunmap ?
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
"stay doesn't move the cursor

" Fix-up keycodes
" PuTTY in XTermR6 mode
"set <F1>=OP
"set <F2>=OQ
"set <F3>=OR
"set <F4>=OS
"set <F5>=[15~
"set <F6>=[17~
"set <F7>=[18~
"set <F8>=[19~
"set <F9>=[20~
"set <F10>=[21~
"set <F11>=[23~
"set <F12>=[24~

" NB: S-F1 == F11, so S-F1 is probably unreachable
" NB: S-F2 == F12, so S-F2 is probably unreachable
"set <S-F1>=[23~
"set <S-F2>=[24~
"set <S-F3>=[25~
"set <S-F4>=[26~
"set <S-F5>=[28~
"set <S-F6>=[29~
"set <S-F7>=[31~
"set <S-F8>=[32~
"set <S-F9>=[33~
"set <S-F10>=[34~
"set <S-F11>=[23~
"set <S-F12>=[24~

" C-v {key combination} to insert it
" set <S-F2>=[1;2Q
" set <S-F3>=[1;2R
" set <S-F4>=[1;2S

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



"set mouse=r
set mouse=ar
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
"set go -=m
"set go -=T
"set go -=r

au BufNewFile,BufRead Jenkinsfile set filetype=groovy
au BufNewFile,BufRead SCons* set filetype=scons
au BufNewFile,BufRead scons* set filetype=scons
au BufNewFile,BufRead *.scons set filetype=scons
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.td set filetype=tablegen
au BufNewFile,BufRead *.inc set filetype=cpp

augroup vimrc
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

set number
set hidden
set cindent
set formatoptions+=r
filetype plugin on

"Terminal mode shortcuts
tnoremap <Esc><Esc> <C-\><c-n>
tnoremap <C-V> <C-W>"0

"set comments=s1:/*, mb:\ *, elx:\ */
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <F12> :BufExplorer<CR>
" Previous / next line in quickwindow
nnoremap <silent> <F2> :cp<CR>zz
nnoremap <silent> <F3> :cn<CR>zz
nnoremap <silent> <F4> :exe "cc".line('.')<CR>
nnoremap <F5> :lprevious<CR>
nnoremap <F6> :lnext<CR>
nnoremap <F7> :lopen<CR>
" Jump to line selected in quickwindow
"nnoremap <S-F4> :exe "ll".line('.')<CR>
" Jump to quickwindow line when double clicking on a line in the quickwindow
"nnoremap <2-LeftMouse> :exe "cc".line('.')<CR>
"nnoremap <silent><F7> :GundoToggle<CR>
nnoremap <F8> :GitGutterNextHunk<CR>
nnoremap <silent> <F5> :cp<CR><C-o>
nnoremap <silent> <F6> :cn<CR><C-o>
" Pull / push a change from current buffer when in diff mode
"nnoremap <silent> <F5> :.,.diffget<CR>:diffupdate<CR>]c
"nnoremap <silent> <F6> :.,.diffput<CR>:diffupdate<CR>]c
"Search / replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
"Search for word under cursor in all the source code files
nnoremap <Leader>f :FindCode <C-r><C-w> .
nnoremap <Leader>F :FindCodel <C-r><C-w> .
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
nnoremap <F9> :wa<CR>:Make!<CR>
"nnoremap <F10> :wa<CR>:call MyMake()<CR>
nnoremap <F10> :wa<CR>:call MakeBazel()<CR>
nnoremap <C-f> :FZF<CR>
nnoremap <Tab>q :Copen<CR>
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
inoremap <C-F> <C-R>=expand("%").":".line(".")<CR>
"nnoremap <Esc>f :let @@=expand("%").":".line(".")<CR>
function! EditFileLine(file_line)
  let l:parts = split(a:file_line,":")
  echo l:parts
  exe "edit +".l:parts[1]." ".l:parts[0]
endfunction

function! LoadOther (file_no_ext, ext, ...)
  if a:0 > 0 && a:1 != ""
    exe "edit ".a:file_no_ext.".".a:1
  else
    let l:cwd = resolve(getcwd())
    if l:cwd =~ "tensorflow"
      if a:ext == 'cc'
        exe "edit ".a:file_no_ext.".h"
      else
        exe "edit ".a:file_no_ext.".cc"
      end
    elseif l:cwd =~ "poptorch"
      if a:ext == 'cpp'
        let l:path = substitute(a:file_no_ext, "/source/","/include/poptorch/", "")
        exe "edit ".l:path.".hpp"
      else
        let l:path = substitute(a:file_no_ext, "/include/poptorch/", "/source/", "")
        exe "edit ".l:path.".cpp"
      end
    elseif a:file_no_ext =~ "willow"
      if a:ext == 'cpp'
        let l:path = substitute(a:file_no_ext, "/src/","/include/popart/", "")
        exe "edit ".l:path.".hpp"
      else
        let l:path = substitute(a:file_no_ext, "/include/popart/", "/src/", "")
        exe "edit ".l:path.".cpp"
      end
    elseif a:ext == 'hpp'
      " s/include/lib/
      let l:path = substitute(a:file_no_ext, "/include/","/lib/","")
      exe "edit ".l:path.".cpp"
    elseif a:ext == 'cpp'
      let l:path = substitute(a:file_no_ext, "/lib/","/include/", "")
      exe "edit ".l:path.".hpp"
    end
  end
endfunction

function! LoadOtherTF (file)
  let l:full_path = resolve(a:file)
  let l:cwd = resolve(getcwd())
  let l:other ="foo"
  if l:cwd =~ "/_tensorflow"
    let l:other = substitute(l:cwd, "/_tensorflowview", "/tensorflowview", "")
  else
    let l:other = substitute(l:cwd, "/tensorflowview", "/_tensorflowview", "")
  end
  if l:full_path =~ l:other
    exe "edit ". substitute(l:full_path, l:other."/", "", "")
  else
    exe "edit ". substitute(l:full_path, l:cwd, l:other, "")
  end
endfunction

command! -nargs=? Other call LoadOther(expand("%:r"),expand("%:e"),"<args>")
command! -nargs=? OtherTF call LoadOtherTF(expand("%:p"))

function! LoadLogfile( logfile, warning, errors )
  "set errorformat=%tRROR:\ %f:%l:%c:%m,%f:%l:%c\ %trror:%m,%tRROR:%m\ %f:%l:%c%[\\,:],%tRROR:%m\ %f:%l%[\\,:],%tRROR:%m\ (see\ %f),%tRROR:%m
  set errorformat=""
  if a:warning == 1
    set errorformat +=%tARNINGCPP:\ %f:%l:%c:\ warning:%m,%tARNINGCPP:%m\ %f:%l:%c:,%tARNINGCPP:\ %f:%l:%c\ %m
  end 
  if a:errors ==1
    set errorformat+=%tRROR:\ %f:%l:%c:%m,%f:%l:%c\ %trror:%m,%tRROR:%m\ %f:%l:%c%[\\,:],%tRROR:%m\ %f:%l%[\\,:],%tRROR:%m\ (see\ %f),%tRROR:\ \ \ File\ \"%f\"\\,\ line\ %l\\,\ %m
  elseif a:errors ==2
    set errorformat+=%tRROR:\ %f:%l:%c:%m,%f:%l:%c\ %trror:%m,%tRROR:%m\ (see\ %f),%tRROR:\ \ \ File\ \"%f\"\\,\ line\ %l\\,\ %m
  end

  "set errorformat=%tRROR:\ %f:%l:%c:%m,%f:%l:%c\ %trror:%m,%tRROR:%m\ %f:%l:%c%[\\,:],%tRROR:%m\ %f:%l%[\\,:],%tRROR:%m\ (see\ %f),%tRROR:\ \ \ File\ \"%f\"\\,\ line\ %l\\,\ %m
  exe "cfile ".a:logfile
  copen
  set errorformat&
  exe "wincmd p"
  redraw!
endfunction

function! MakeBazel()
  set errorformat +=%t\ \ \ \ \ File\ \"%f\"\\,\ line\ %l
  make
  set errorformat&
  "call LoadLogfile("output.log", 1, 1)
endfunction

function! TempCreate()
  let tmp=tempname()
  exe "! mkdir -p $(dirname ".tmp.")"
endfunction

function! MyMake()
  let tmp=tempname()
  exe "silent !clear; stdbuf -o0 ./build.sh 2>&1 | tee ".tmp." && (exit ${PIPESTATUS[0]})"
  if v:shell_error
    exe "cfile ".tmp
    exe "copen"
    exe "silent !notify-send 'Build Failed' -i /usr/share/icons/gnome/48x48/emotes/face-crying.png"
  else
    exe "silent !notify-send 'Build successful' -i /usr/share/icons/gnome/48x48/emotes/face-smile.png"
  end
  redraw!
endfunction

function! CD()
  if bufname("") !~ "^ftp://"
    lcd %:p:h
  endif
endfunction

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

function! FindAnyFunc( flags, prefix, expr, ... )
    if a:0 > 0
        let path = a:1
    else
        let path= "."
    end
    let tmp=tempname()
    exe "!grep -R ".a:flags." -n \"". a:expr."\" ". path." --exclude-dir=\.linters --exclude-dir=\.cache --exclude-dir=\.git | sort > ".tmp
    exe a:prefix."file ".tmp
    exe a:prefix."open"
endfunction

function! FindInBuffersFunc( expr )
    call setqflist([])
    call "cclose"
    exe "bufdo silent vimgrepadd! ".a:expr." %"
    exe "copen"
endfunction

function! FindCodeFunc( flags, prefix, expr, ... )
    if a:0 > 0
        let path = a:1
    else
        let path= "."
    end
    let tmp=tempname()
    exe "!grep -R -n ". a:flags." --include=*.yml --include=*.td --include=*.py --include=*.c --include=*.cpp --include=*.cc --include=*.cl --include=*.h --include=*.hpp --include=*.rst --include=*.inc --exclude-dir=\.cache --exclude-dir=\.linters --exclude-dir=\.git \"". a:expr."\" ". path." | sort > ".tmp
    exe a:prefix."file ".tmp
    exe a:prefix."open"
endfunction

function! FindTxtFunc( flags, prefix, expr, ... )
    if a:0 > 0
        let path = a:1
    else
        let path= "."
    end
    let tmp=tempname()
    exe "!grep -R -n ". a:flags." --include=*.txt --exclude-dir=\.cache --exclude-dir=\.linters --exclude-dir=\.git \"". a:expr."\" ". path." | sort > ".tmp
    exe a:prefix."file ".tmp
    exe a:prefix."open"
endfunction

function! FindCodeLongFunc( prefix, ...)
    if a:0 > 0
        let path = a:1
    else
        let path= "."
    end
    call FindCodeFunc( "", a:prefix, '.\{81\}', path)
    "exe "OverLength"
endfunction

function! FindHexFunc( expr, ... )
    if a:0 > 0
        let path = a:1
    else
        let path= "."
    end
    let tmp=tempname()
    exe "!grep -R -n --include=*.hex ". a:expr." ". path." --exclude-dir=\.cache --exclude-dir=build --exclude-dir=\.git > ".tmp
    exe "cfile ".tmp
    exe "copen"
endfunction

function! CscopeCreate_func(...)
    if a:0 > 0
        let path = join(a:000)
    else
        let path= "."
    end
    let tmp=tempname()
    let result = system('find '.path.' -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.cc" > '.tmp)
    exe "!cat ".tmp
    let result = system("cscope -b -q -i ".tmp)
    exe "cscope add cscope.out"
    exe "CCTreeLoadDB cscope.out"
endfunction

function! OpenFilesFunc( extra, ... )
    if a:0 > 0
        let path = a:1
    else
        let path = '.'
    end
    let cmd="find ".path." ".a:extra
    if a:0 < 2
        let cmd= cmd." -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.cl'"
    else
        let i = 2
        let cmd = cmd." -name '*.". a:000[1]."'"
        while i < a:0
            let cmd = cmd." -o -name '*.". a:000[i]."'"
            let i += 1
        endwhile
    end
    let result = system(cmd."| tr '\n' ' '")
    exe "args ".result
endfunction

function! MoveToLocation_func()
    exe "lfile ". &errorfile
    exe "lopen"
endfunction

function! DoxyTabF()range
    let range = a:firstline . ',' . a:lastline
    exe range . 'Tabularize /^[^\]]\+]'
    exe range . 'Tabularize /^[^\]]\+] \+[^ ]\+ \+/l0'
endfunction
function! GtagsAutoUpdate()
        let l:result = system("global -u --single-update=\"" . expand("%") . "\"")
endfunction

"function! CopenFunc()
"    exe "cfile ".s:cache."/scons_output.log"
"    exe "copen"
"endfunction

"command! -nargs=0 Copen call CopenFunc()
command! -nargs=* Ctags !ctags -R -a <f-args>
command! -nargs=* -complete=file OpenFiles call OpenFilesFunc('-maxdepth 1',<f-args>)
command! -nargs=* -complete=file OpenAll call OpenFilesFunc('',<f-args>)
command! -nargs=* -complete=file FindInBuffers call FindInBuffersFunc(<f-args>)
command! -nargs=* -complete=file FindCode call FindCodeFunc("", "c",<f-args>)
command! -nargs=* -complete=file FindTxt call FindTxtFunc("", "c",<f-args>)
command! -nargs=* -complete=file FindCodeIgnoreCase call FindCodeFunc("-i", "c",<f-args>)
command! -nargs=* -complete=file FindCodeLong call FindCodeLongFunc("c",<f-args>)
command! -nargs=* -complete=file FindAny call FindAnyFunc("","c", <f-args>)
command! -nargs=* -complete=file FindAnyIgnoreCase call FindAnyFunc("-i", "c", <f-args>)
command! -nargs=* -complete=file FindCodel call FindCodeFunc("", "l",<f-args>)
command! -nargs=* -complete=file FindAnyl call FindAnyFunc("", "l", <f-args>)
command! -nargs=* -complete=file FindHex call FindHexFunc(<f-args>)
command! -nargs=* -complete=file CscopeCreate call CscopeCreate_func(<f-args>)
command! -nargs=1 -complete=file LoadLogfile call LoadLogfile(<f-args>, 1, 1)
command! -nargs=1 -complete=file LoadWarnings call LoadLogfile(<f-args>, 1, 0)
command! -nargs=1 -complete=file LoadErrors call LoadLogfile(<f-args>, 0, 1)
command! -nargs=1 -complete=file LoadErrorsShort call LoadLogfile(<f-args>, 0, 2)
command! -nargs=1 Open call Open(<args>)
command! -nargs=1 E call EditFileLine(<f-args>)
command! -nargs=1 Diff :vertical diffpatch <f-args>
command! -nargs=0 Wsudo :w !sudo tee > /dev/null %
command! -nargs=0 Cp :e ~/tmp/cp.txt
command! -nargs=0 TempCreate call TempCreate()

cnoreabbrev FC FindCode
cnoreabbrev FA FindAny
cnoreabbrev FT FindText

command! -nargs=0 Hexon :%!xxd
command! -nargs=0 Hexoff :%!xxd -r

command! -nargs=0 Gcheckout :Git checkout %
command! -nargs=0 -range DoxyTab <line1>,<line2> call DoxyTabF()

set nocst "no ctags db
set cscopequickfix=s-,c-,d-,i-,t-,e-
let GtagsCscope_Auto_Load = 1
"Disabled because uses F-<> keys
let GtagsCscope_Auto_Map = 0
let GtagsCscope_Quiet = 1
set cscopetag
set csverb

set statusline=%q[%f][%v,%l/%L][%p%%]
"set statusline=[%f][%l,%v][%p%%][len=%L][%{fugitive#statusline()}]

"Remap the numpad to leader keys:
nmap <Leader>1 <k1>
nmap <Leader>2 <k2>
nmap <Leader>3 <k3>
nmap <Leader>4 <k4>
nmap <Leader>5 <k5>
nmap <Leader>6 <k6>

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
"Definition
:nmap <C-\>d :cs find g <C-R>=expand("<cword>")<CR><CR>
"References
:nmap <C-\>r :cs find c <C-R>=expand("<cword>")<CR><CR>
"Symbol
:nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"String
:nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
":nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"File
:nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"File including file
:nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
":nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"
command! -nargs=* -complete=custom,GtagsCandidate Zdef :cs find g <args>
command! -nargs=* -complete=custom,GtagsCandidate Zfind :cs find t <args>
command! -nargs=* -complete=custom,GtagsCandidate Zgrep :cs find e <args>
command! -nargs=* -complete=custom,GtagsCandidate Zsymbol :cs find s <args>
command! -nargs=* -complete=custom,GtagsCandidate Zfile :cs find f <args>
command! -nargs=* -complete=custom,GtagsCandidate Zinclude :cs find i <args>
command! -nargs=0 Conflicts /^[<=>]\{7\}
command! -nargs=0 MoveToLocation call MoveToLocation_func()
command! -nargs=0 RemovePrefix :%s/^20[^]]*]//

"command! -nargs=0 IgnoreWarningsOn :set errorformat=%EERROR:\ %f:%l:%c:%m,%f:%l:%c\ %trror:%m
":set errorformat=%EERROR:\ %f:%l:%c:%m,%f:%l:%c\ %trror:%m,%CIn\ file\ included\ from\ %f:%l:%c%m,%-GINFO:\ %m,%-GWARNING:\ %m,%-G%f:%l:%c:\ %tarning:%m,%C%*[\ ]from\ %f:%l%m
"command! -nargs=0 IgnoreWarningsOff :set errorformat&

:autocmd! BufWritePost * call GtagsAutoUpdate()

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
command! -nargs=0 OverLength :match OverLength /\%81v.\+/
command! -nargs=0 NoOverLength :match none
command! -nargs=0 CopyFilename let @"=expand("%")

"Create a bookmark for the current cursor with the word under the cursor as id
:nmap <Leader>b :Bookmark <C-R>=expand("<cword>")<CR>

"Open .cl files as C files
au BufNewFile,BufRead *.cl set filetype=c
au BufEnter * :checktime

"Make ctrlp browse buffers instead of files by default
let g:ctrlp_cmd='CtrlPMRU'
let g:ctrlp_working_path_mode=''
let g:ctrlp_mruf_relative=1
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore= {
    \ 'dir': 'build$\|data$',
    \ 'file': '\.o$\|\.pyc$' }

let g:EasyMotion_leader_key = '<Tab>'

let g:ycm_use_clangd = 0
"let g:ycm_clangd_args='-background-index'
"let g:ycm_extra_conf_globlist = [s:home.'/.vim/*']
let g:ycm_global_ycm_extra_conf= s:home .'/.vim/ycm_extra_conf.py'
"let g:ycm_server_keep_logfiles =1
"let g:ycm_server_log_level='debug'
"let g:ycm_server_use_vim_stdout=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list=1
let g:ycm_enable_diagnostic_highlighting=0
" Trying to speed up vim scrolling:
let g:ycm_echo_current_diagnostic = 1 "Causes slow down
let g:ycm_auto_trigger = 1 "Use C-Space for auto complete when set to 0
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 5

let g:gundo_prefer_python3 = 1

map \w <Plug>CamelCaseMotion_w
map \e <Plug>CamelCaseMotion_e
map \q <Plug>CamelCaseMotion_b

" use overlay feature:
let g:choosewin_overlay_enable = 0
let g:choosewin_keymap = { ' ': 'previous'}
let g:choosewin_label='FJDKLAUITR'
nmap <Space> <Plug>(choosewin)

nnoremap <C-\>] :tag <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <C-]> :YcmCompleter GoToDeclaration<CR>
"nnoremap <silent> <C-[> :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <C-[> :cs find g <C-R>=expand("<cword>")<CR><CR>

cnoremap <C-d> <c-r>=expand('%:p:h')<CR>

nnoremap x <C-e>
nnoremap c <C-y>
imap jj <Esc>

"Load pathogen as a module (Pathogen will then load all the other modules
source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

exe "Helptags"

hi SignColumn   ctermfg=DarkYellow ctermbg=Black      guifg=#C4A000    guibg=#000000 cterm=none term=bold
hi GitGutterAdd ctermfg=DarkGreen ctermbg=Black
hi GitGutterChange ctermfg=DarkYellow ctermbg=Black
hi GitGutterDelete ctermfg=DarkRed ctermbg=Black

unmap <Esc>
" Prevent YCM from closing the quickfix window
set eventignore=WinLeave

set runtimepath=~/vim/runtime/
set rtp+=~/.vim/
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'shougo/neocomplcache'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'octol/vim-cpp-enhanced-highlight'
Plugin 'FSwitch'

try
  set undodir=~/.vim/undodir
  set undofile
  set undolevels = 1000 "maximum number of changes that can be undone
  set undoreload = 10000 "maximum number lines to save for undo on a buffer reload
catch
endtry

filetype plugin indent on

let g:neocomplcache_enable_at_startup = 1

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


"Neocomplcache tab completation
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"Syntastic check upon open
let g:syntastic_check_on_open=1
let g:syntastic_cpp_check_header = 1

let g:ctrlp_custom_ignore = 'X86*'

set tags=./tags;
let g:easytags_dynamic_files = 1
"highlight the fuck out of those ctags

set path+=$devel

"FSwitch Settings
"on a cxx enter turn on fswitch look for a .h locally and then in $devel
au! BufEnter *.cxx let b:fswitchdst = 'h' | let b:fswitchlocs = '.'
"reverse of previous
au! BufEnter *.h let b:fswitchdst = 'cxx' | let b:fswitchlocs = '.'
"\of to open in same window
nmap <silent> <Leader>of :FSHere<cr>
"\ol on right
nmap <silent> <Leader>ol :FSRight<cr>
"\oL new split right
nmap <silent> <Leader>oL :FSSplitRight<cr>
"\oh split left
nmap <silent> <Leader>oh :FSLeft<cr>
"\oH new split left
nmap <silent> <Leader>oh :FSSplitLeft<cr>

syntax on
set background=dark
colorscheme solarized
set nocompatible
set number
set t_Co=256

set smartindent
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab

set wrap
set textwidth=74
set encoding=utf-8
set formatoptions=qrn1


if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  "     " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

nmap <space> zz
nmap n nzz
nmap N Nzz
nnoremap j gj
nnoremap k gk
nnoremap d "_d
vnoremap d "_d

vnoremap p "_dP

set runtimepath=~/vim/runtime/
set rtp+=~/.vim/
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/neocomplcache'
Plugin 'kien/ctrlp.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'FSwitch'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'gregsexton/MatchTag'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'altercation/vim-colors-solarized'

set number
try
  set undodir=~/.vim/undodir
  set undofile
  set undolevels = 1000 "maximum number of changes that can be undone
  set undoreload = 10000 "maximum number lines to save for undo on a buffer reload
catch
endtry

"identify .es6 as javascript
au! BufEnter *.es6 set ft=javascript

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
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", "proprietary attribute \tf-"]
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_aggregate_errors = 1

let g:ctrlp_custom_ignore = 'X86*\|bower_compontents\|node_modules\|\.git\|docs|\build'

set tags=./tags;
let g:easytags_dynamic_files = 1
"highlight the fuck out of those ctags

set path+=$devel

"FSwitch Settings
"on a directive.js enter turn on fswitch to look for a spec
au! BufEnter *.directive.js let b:fswitchdst = '.directive.spec.js' | let b:fswitchlocs = '.'
au! BufEnter *.directive.spec.js let b:fswitchdst = '.directive.js' | let b:fswitchlocs = '.'
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

"EasyMotion Settings
map <Leader>l <Plug>(easymotion-lineforward)

"always show status bar
set laststatus=2

syntax on
set background=dark
colorscheme solarized
set nocompatible
set t_Co=256

set smartindent
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab

au FileType gitcommit set spell

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

function Gdist()
  ! grunt dist
endfunction
command Gdist call Gdist()

function Gsass()
  ! grunt sass:uncompressed
endfunction
command Gsass call Gsass()

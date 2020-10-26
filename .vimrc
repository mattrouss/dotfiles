set nocompatible      
filetype off

" Add Vundle Plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"
" Add Vundle plugins here
"
Plugin 'airblade/vim-gitgutter.git'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'python-mode/python-mode'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'srcery-colors/srcery-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}


call vundle#end()
filetype plugin indent on

let g:powerline_pycmd="py3"


"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Mouse
set mouse=a

"" Highlight cursor line
set cursorline

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

"" Splits
set splitright

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Pretty Searching 
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

let g:gruvbox_contrast_dark = 'hard'
set bg=dark
colorscheme gruvbox

"" Hightlight 80 cc ruler
set cc=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


syntax on
set ruler
set number

set norelativenumber
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber 

let no_buffers_menu=1

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"****************************************************************************
"" Keymap Settings
"****************************************************************************

"" Search mappings: These will make it so that going to the next one in a
"" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" File Utility Mappings
nnoremap <C-!> :x<CR>

"" Tab mappings

nnoremap <C-t> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

"****************************************************************************
"" Plugin Settings
"****************************************************************************

"
" NERDTree
"
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"
" GitGutter
"
set updatetime=100
"let g:gitgutter_highlight_lines = 1
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

let g:gitgutter_preview_win_floating = 1
nmap (h <Plug>(GitGutterNextHunk)
nmap )h <Plug>(GitGutterPrevHunk)

"
" AsyncRun
"
:let g:asyncrun_open = 8
noremap <silent> <F7> :AsyncRun -cwd=<root>/build cmake .. && make -j8 <cr> 
noremap <silent> <F8> :AsyncRun -cwd=<root> sh .run.sh <cr>

""
"" Display hunk changes on cursor hover
"au CursorMoved * if gitgutter#hunk#in_hunk(line(".")) | GitGutterPreviewHunk | else | pclose | endif

""Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0

"" Python Mode

:autocmd WinEnter * if winnr('$') == 1 && ! empty(&buftype) && ! &modified | quit | endif


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'ajh17/VimCompletesMe'
Plugin 'joshdick/onedark.vim'
Plugin 'tpope/vim-surround'
Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ALE Settings

let g:ale_linters = {
\ 'javascript': ['prettier'],
\ 'markdown': ['markdownlint'],
\}

let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'markdown': ['markdownlint'],
\}


" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
endif

syntax on

" lightline.vim settings

set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'onedark' }
colorscheme onedark

" Keybinds

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

set number
set cursorline
set wrap
set autoindent

set incsearch
" set ignorecase
set smartcase

let mapleader=","

nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $


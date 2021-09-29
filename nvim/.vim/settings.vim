" GENERAL VIM SETTINGS

set nocompatible              " be iMproved, required
filetype off                  " required

" -- Color Settings -- w/ tmux, general
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
if !has('gui_running')
  set t_Co=256
endif

syntax enable 
colorscheme material
let g:material_theme_style = 'darker'
hi MatchParen cterm=underline,bold ctermbg=none

set tabstop=2
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
" Make edited buffers persist on tab or split close
set hidden
" Relative line toggles in normal mode
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Filetype indent and setting detection
filetype plugin indent on

set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader=","

" --- VimPlug Setup ---
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" - Utility -
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" - Typing Code QoL -
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'zhou13/vim-easyescape'
Plug 'easymotion/vim-easymotion'
" HTML
Plug 'alvan/vim-closetag'
" JavaScript/React
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

" - File Navigation -
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" - a e s t h e t i c s -
Plug 'itchyny/lightline.vim'
Plug 'kaicataldo/material.vim', {'branch': 'main'}

" All of your Plugins must be added before the following line
call plug#end()            " required

" --- coc.nvim Settings ---

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-tslint-plugin',
  \ 'coc-json',
  \ ]
  " \ 'coc-prettier',

" - coc.nvim Prettier settings -

" Command to format on save
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" - coc.nvim Keybinds -

" Use <TAB> and <S-TAB> to cycle through autocomplete options
" This is all from the coc.nvim README so I'm just as confused as you are
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <C-Space> coc#refresh()

" Use <cr> to choose autocomplete option - the rest is coc.nvim nonsense
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename current word
nmap <Leader>rn <Plug>(coc-rename)

" Use <Leader>H to show Vim man pages of word under cursor
nnoremap <silent> <Leader>H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" -- CoCList Mappings --
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document - broken?
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

" --- lightline.vim Settings ---

set laststatus=2
set noshowmode

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

" --- Keybinds ---

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

nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
nnoremap J <C-d>
nnoremap K <C-u>

nnoremap U <C-r>

" Easy save and quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" -- easy-escape.vim settings -- set jk and kj as <Esc> in Insert mode
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <Esc>`^
cnoremap kj <Esc>`^

" -- easymotion settings --
" <Leader>f{char} to move to {char}
map f <Plug>(easymotion-bd-f)
map f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)

" -- NERDTree Settings --

nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

autocmd StdinReadPre * let s:std_in=1
" Open NERDTree on startup if no file was specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree on startup if directory was specified
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeGitStatusWithFlags = 1

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


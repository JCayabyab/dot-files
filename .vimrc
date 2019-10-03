set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Utility
Plug 'wesQ3/vim-windowswap'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-snippets', {'do': 'npm ci'}
Plug 'neoclide/coc-tsserver', {'do': 'npm ci'}
Plug 'neoclide/coc-prettier', {'do': 'npm ci'}
Plug 'neoclide/coc-eslint', {'do': 'npm ci'}
Plug 'neoclide/coc-tslint', {'do': 'npm ci'}
Plug 'neoclide/coc-css', {'do': 'npm ci'}
Plug 'neoclide/coc-lists', {'do': 'npm ci'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'npm ci'} " color highlighting
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Typing Code QoL
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'zhou13/vim-easyescape'
Plug 'jiangmiao/auto-pairs'

" JavaScript/React
Plug 'othree/yajs.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

" a e s t h e t i c s
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Formatters

au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" ALE Settings

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}
let g:ale_fix_on_save = 1

let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'

nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error

" LanguageClient

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }

nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>

" coc.nvim Settings

" https://github.com/neoclide/coc.nvim#example-vim-configuration
inoremap <silent><expr> <c-space> coc#refresh()

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)


" Color Settings w/ tmux, general
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

nnoremap <A-F> mzgggqG`z

au FileType * setlocal formatoptions-=cro

" easy-escape

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 150
cnoremap jk <Esc>
cnoremap kj <Esc>

let &t_SI .= "\<Esc>[5 q"
let &t_EI .= "\<Esc>[2 q"

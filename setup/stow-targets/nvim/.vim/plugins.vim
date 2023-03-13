" VIMPLUG SETTINGS/PLUGINS :)

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

" -- easy-escape.vim settings -- set jk and kj as <Esc> in Insert mode
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100

" -- NERDTree Settings --

autocmd StdinReadPre * let s:std_in=1
" Open NERDTree on startup if no file was specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree on startup if directory was specified
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close vim if NERDTree is the only window left

let g:NERDTreeGitStatusWithFlags = 1

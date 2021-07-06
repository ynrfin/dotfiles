" Search down into subfolder
" Provide auto-completion for all file related tasks
set path+=**

set nocompatible
" vundle setting example make this off
filetype off

" Set leader to space, default \
nnoremap <SPACE> <Nop>
let mapleader=" "

set encoding=utf-8

set ts=4 " set visual tabs to have 4 spaces

set shiftwidth=4 " when indeting with >, use 4 spaces width

set expandtab " on pressing tab, insert 4 spaces

set cursorline " show visual line below current line

set wildmenu " set visual autocomplete for command menu

set showmatch " highlight matching bracket

" search as charracter is entered
set incsearch
" highlight matches
set hlsearch

" give indicator on said line, could be comma separated too!
set colorcolumn=79

" set wordwrap close to 80 char
" set tw=80

" set soft wrap, display it multiple lines
" set wrap linebreak nolist

" set new split buffer to the right of current one
set splitright

" set vsplit to below
set splitbelow

" set case insensitive on search
set ignorecase
set smartcase

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" try set python 3 provider
let g:python3_host_prog = '/usr/bin/python'

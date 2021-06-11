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

" set visual tabs to have 4 spaces
set ts=4

" when indeting with >, use 4 spaces width
set shiftwidth=4

" on pressing tab, insert 4 spaces
set expandtab

" show visual line below current line
set cursorline

" set visual autocomplete for command menu
set wildmenu

" highlight matching bracket
set showmatch

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

let g:markdown_folding=3

" folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" try set python 3 provider
let g:python3_host_prog = '/usr/bin/python'

" set the runtime path to include Vundle and initialize
" to install new added plugin, go to vim, :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle. required
Plugin 'VundleVim/Vundle.vim'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" auto close bracket
Plugin 'jiangmiao/auto-pairs'

" make surrounding words
Plugin 'tpope/vim-surround'

" vim plugins for theming
Plugin 'itchyny/lightline.vim'

Plugin 'altercation/Vim-colors-solarized'

"" Snippet collection from Ultisnips example(recomendation)
Plugin 'honza/vim-snippets'

Plugin 'Yggdroot/LeaderF'

Plugin 'scrooloose/nerdtree'

Plugin 'junegunn/goyo.vim'

Plugin 'vimwiki/vimwiki'

Plugin 'morhetz/gruvbox'

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

Plugin 'sheerun/vim-polyglot'

Plugin 'liuchengxu/vista.vim'

" Markdown folding
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'ryanoasis/vim-devicons'

Plugin 'jwalton512/vim-blade'
Plugin 'mattn/emmet-vim'
Plugin 'Yggdroot/indentLine'

" All your plugins must be added before the following line
call vundle#end()

map <F3> :NERDTreeToggle<CR>
map <S-F3> :NERDTreeRefreshRoot<CR>

map <F8> :Vista!!<CR>

" Ultisnips trigger config
"let g:UltiSnipsExpandTrigger="<C-j>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
" this is not working yet
"let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

filetype plugin indent on

syntax enable
set background=dark
colorscheme gruvbox
"colorscheme solarized

" set line number
set number
" enable backspace to delete fist line and go to previous line
set backspace=2

" Vimwiki
let wiki_1 = {}
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let g:vimwiki_list = [wiki_1]
let g:vimwiki_global_ext = 0 " Make vim wiki only set filetype of markdown file inside wiki dir
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

let g:NERDTreeDirArrowExpandable = 'ﲖ'
let g:NERDTreeDirArrowCollapsible = 'ﲔ'


"make find to use ctrl p
map <C-p> :Leaderf file<CR>

" setting for yggdroot/indentline
let g:indentLine_setColors=0
let g:indentLine_char='┆'

" Remove trailing whitespaces on :w
autocmd BufWritePre * %s/\s\+$//e

"autocmd BufNewFile,BufRead *.blade.php setlocal ft=blade

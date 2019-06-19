" Search down into subfolder
" Provide auto-completion for all file related tasks
set path+=**

set nocompatible
" vundle setting example make this off
filetype off

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

" YCM for code completion
Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path=[]
let g:ycm_extra_conf_vim_data = [
    \ 'g:ycm_python_interpreter_path',
    \ 'g:ycm_python_sys_path'
\]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" Ultisnip for snippet
Plugin 'SirVer/ultisnips'

" Snippet collection from Ultisnips example(recomendation)
 Plugin 'honza/vim-snippets'

" Ultisnips trigger config
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
" this is not working yet
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" Split windows vertically
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.dotfiles/vim/UltiSnips']

Plugin 'scrooloose/nerdtree'
map <F3> :NERDTreeToggle<CR>

Plugin 'majutsushi/tagbar'
map <F8> :TagbarToggle<CR>

Plugin 'junegunn/goyo.git'

Plugin 'vimwiki/vimwiki'

Plugin 'shawncplus/phpcomplete.vim'

Plugin 'morhetz/gruvbox'

" All your plugins must be added before the following line
call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
colorscheme gruvbox

" set line number
set number
" enable backspace to delete fist line and go to previous line
set backspace=2

" set powerline fonts
let g:airline_powerline_fonts=1
" Set vim-airline theme
let g:airline_theme='deus'
let g:airline_solarized_bg='dark'

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

" make find to use ctrl p
map <C-p> :find 

" set wordwrap close to 80 char
set tw=80

" set soft wrap, display it multiple lines 
set wrap linebreak nolist

" set new split buffer to the right of current one
set splitright

" set vsplit to below
set splitbelow

" set case insensitive on search
set ignorecase
set smartcase

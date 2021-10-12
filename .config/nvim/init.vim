source $HOME/.config/nvim/vim/settings.vim

let g:markdown_folding=3

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

" Comment
Plugin 'tpope/vim-commentary'

" vim plugins for theming
Plugin 'itchyny/lightline.vim'

Plugin 'altercation/Vim-colors-solarized'

"" Snippet collection from Ultisnips example(recomendation)
Plugin 'honza/vim-snippets'

"Plugin 'Yggdroot/LeaderF'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'

Plugin 'scrooloose/nerdtree'

Plugin 'junegunn/goyo.vim'

Plugin 'vimwiki/vimwiki'

Plugin 'morhetz/gruvbox'
Plugin 'arcticicestudio/nord-vim'

"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'neovim/nvim-lspconfig'
Plugin 'kabouzeid/nvim-lspinstall'
Plugin 'hrsh7th/nvim-compe'
" Plugin 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plugin 'sheerun/vim-polyglot'

" Better syntax higlighting
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


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

" Set vim-markdown conceal mode to no, it is hard to edit when the tilde is
" concealed
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

"make find to use ctrl p
"map <C-p> :Leaderf file<CR>


" Setup 'kabouzeid/nvim-lspinstall'
lua << EOF
EOF

syntax enable
set termguicolors
let g:gruvbox_contrast_dark ='hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection ='0'
set background=dark
colorscheme nord

" Setup neovim-lspconfig
" set termguicolors & colorscheme before initialise lsp
" or error message color will be white instead of red
lua << EOF
require'lspconfig'.gopls.setup{}
require'lspconfig'.intelephense.setup{}
EOF

" setup Telescope
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--hidden',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    -- make selected on top right below prompt
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" setting for yggdroot/indentline
let g:indentLine_setColors=0
let g:indentLine_char='┆'

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" Remove trailing whitespaces on :w
autocmd BufWritePre * %s/\s\+$//e

"autocmd BufNewFile,BufRead *.blade.php setlocal ft=blade
"

lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}
EOF

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

"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'neovim/nvim-lspconfig'
Plugin 'kabouzeid/nvim-lspinstall'
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

" Set vim-markdown conceal mode to no, it is hard to edit when the tilde is
" concealed
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

"make find to use ctrl p
"map <C-p> :Leaderf file<CR>


" Setup 'kabouzeid/nvim-lspinstall'
lua << EOF
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
EOF

" Setup neovim-lspconfig
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
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
"
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

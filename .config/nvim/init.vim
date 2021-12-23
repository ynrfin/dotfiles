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


"Plugin 'Yggdroot/LeaderF'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'

Plugin 'scrooloose/nerdtree'

Plugin 'junegunn/goyo.vim'

Plugin 'vimwiki/vimwiki'

Plugin 'morhetz/gruvbox'
Plugin 'arcticicestudio/nord-vim'
Plugin 'sainnhe/everforest'

" Markdown folding
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'ryanoasis/vim-devicons'

Plugin 'Yggdroot/indentLine'

" show buffer list
Plugin 'akinsho/bufferline.nvim'

" LSP plugins
Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/cmp-nvim-lsp'
Plugin 'hrsh7th/nvim-cmp' " The Engine
Plugin 'hrsh7th/cmp-buffer' " completion from current buffer
Plugin 'hrsh7th/cmp-path' " completion for path /
Plugin 'hrsh7th/cmp-cmdline' " completion on commandline :
Plugin 'onsails/lspkind-nvim' " completion indicator
Plugin 'ray-x/lsp_signature.nvim' " function signature

" For luasnip users.
Plugin 'L3MON4D3/LuaSnip'
Plugin 'saadparwaiz1/cmp_luasnip'
Plugin 'rafamadriz/friendly-snippets'

" Better syntax higlighting
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update



" All your plugins must be added before the following line
call vundle#end()

" set line number
set number
" enable backspace to delete fist line and go to previous line
set backspace=2

syntax enable

set termguicolors

filetype plugin indent on
set completeopt=menu,menuone,noselect

map <F3> :NERDTreeToggle<CR>
map <S-F3> :NERDTreeRefreshRoot<CR>

map <F8> :Vista!!<CR>


let g:NERDTreeDirArrowExpandable = 'ﲖ'
let g:NERDTreeDirArrowCollapsible = 'ﲔ'

" Set vim-markdown conceal mode to no, it is hard to edit when the tilde is
" concealed
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

let g:gruvbox_contrast_dark ='hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection ='0'
set background=dark
colorscheme everforest
"colorscheme nord
"colorscheme solarized

lua << EOF
  vim.opt.list= true
  vim.opt.listchars:append("eol:↴")
  -- vim.opt.listchars:append("space:⋅")
  require("bufferline").setup()
-- setup nvim-cmp
  local cmp = require'cmp'
  local lspkind = require'lspkind'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    -- sources for completion
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    }),
    experimental = {
        ghost_text =true
    },
    formatting = {
        with_text = true,
        format = lspkind.cmp_format{
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                luasnip = "[snip]",
                path = "[path]",
            }
        }
    }

  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, {
--       { name = 'cmdline' }
--     })
--   })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['intelephense'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }

  require("lsp_signature").setup({
      bind = true,
      floating_window=true
  })


-- You can also use lazy loading so you only get in memory snippets of languages you use
require("luasnip/loaders/from_vscode").lazy_load({ paths = "~/.vim/bundle/friendly-snippets"})

-- setup Telescope
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '-u'
    },
    selection_caret = "> ",
    prompt_prefix = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    -- make selected on top right below prompt
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
      preview_cutoff = 120,
      -- height = 1,
      prompt_position = "top",
    },
    path_display = {
      "absolute"
    };
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
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
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
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


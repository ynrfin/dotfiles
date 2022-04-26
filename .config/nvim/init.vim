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
" Plugin 'tpope/vim-commentary'
Plugin 'numToStr/Comment.nvim'

" vim plugins for theming
Plugin 'itchyny/lightline.vim'



"Plugin 'Yggdroot/LeaderF'
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'

Plugin 'scrooloose/nerdtree'

Plugin 'junegunn/goyo.vim'

Plugin 'vimwiki/vimwiki'

Plugin 'altercation/Vim-colors-solarized'
Plugin 'morhetz/gruvbox'
" Plugin 'arcticicestudio/nord-vim'
Plugin 'shaunsingh/nord.nvim'
Plugin 'sainnhe/everforest'
Plugin 'rhysd/vim-color-spring-night'

" For diagnostic text color because everforest could not cope with it
Plugin 'folke/lsp-colors.nvim'

" Mar kdown folding
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

" Tabstop determines how many columns a tab counts for.
" Shiftwidth determines how many columns text is indented when using reindent operations.
" Expandtab is what actually uses spaces instead of tabs.
set tabstop=4 shiftwidth=4 expandtab


nnoremap j jzz
nnoremap G Gzz

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

let g:gruvbox_contrast_dark ='soft'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection ='0'
" set background=dark
" colorscheme gruvbox
colorscheme everforest
let g:everforest_diagnostic_virtual_text = 'colored'
" colorscheme nord
" colorscheme solarized

lua << EOF
  vim.opt.list= true
  vim.opt.listchars:append("eol:↴")
  -- vim.opt.listchars:append("space:⋅")
  require("bufferline").setup()

  -- comment vim
  require('Comment').setup()

  require("lsp-colors").setup({
     Error = "#4e3e43",
     Warning = "#4a4940",
     Information = "#404d44",
     Hint = "#394f5a"
   })

-- setup nvim-cmp
  local cmp = require'cmp'
  local lspkind = require'lspkind'
  local luasnip = require'luasnip'

  cmp.setup({
     snippet ={
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    -- sources for completion
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
      { name = 'path' },
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
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

      -- Ctrl+y WORKS
      ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

--      ["<Tab>"] = cmp.mapping(function(fallback)
--        if cmp.visible() then
--          cmp.select_next_item()
--        elseif luasnip.expand_or_jumpable() then
--          luasnip.expand_or_jump()
--        elseif has_words_before() then
--          cmp.complete()
--        else
--          fallback()
--        end
--      end, { "i", "s" }),
--
--      ["<S-Tab>"] = cmp.mapping(function(fallback)
--        if cmp.visible() then
--          cmp.select_prev_item()
--        elseif luasnip.jumpable(-1) then
--          luasnip.jump(-1)
--        else
--          fallback()
--        end
--      end, { "i", "s" }),
    },

  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' },
      { name = 'path' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
   cmp.setup.cmdline(':', {
     sources = cmp.config.sources({
       { name = 'path' }
     }, {
       { name = 'cmdline' }
     })
   })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['intelephense'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require'lspconfig'.gopls.setup{
      -- on_attach => when gopls is attached
       on_attach = function()
        -- arg 3, dont call the function
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        -- where this var is defined
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
         -- go to diagnostic errors
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>de", vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostic<CR>", {buffer=0})
         -- rename var(or symbol??) by lsp. Works by understanding the code
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})

        -- when called from command, it error, but if called here, its okay
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
        -- command for code action
        -- :lua vim.lsp.buf.code_action
      end,
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

-- setup nvim-treesitter
require 'nvim-treesitter.configs'.setup {
    higlight = {
        enable = true
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


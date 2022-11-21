
vim.g.markdown_folding = 3

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
    native_menu = false,
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
window = {
    completion = {
        border = 'rounded',
        scrollbar = '║',
    },
    documentation = cmp.config.window.bordered(),
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

    ["<C-n>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    elseif has_words_before() then
        cmp.complete()
    else
        fallback()
    end
    end, { "i", "s" }),

    ["<C-p>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
    end, { "i", "s" }),
},

})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
mapping = cmp.mapping.preset.cmdline(),
sources = {
    { name = 'buffer' },
    { name = 'path' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
    { name = 'path' }
    }, {
    { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", {buffer=0})
    vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, {buffer=0})
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
file_ignore_patterns = {".git"},
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

-- setup go.nvim
require('go').setup()
-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)


-- setup catppuccin
local catppuccin = require("catppuccin")
catppuccin.setup()

-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- vim.cmd[[colorscheme catppuccin]]

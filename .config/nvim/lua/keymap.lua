vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

vim.g.mapleader = " "
-- vim.g.mapleader = "<Space>"

vim.api.nvim_set_keymap('n', 'j', 'jzz', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'G', 'Gzz', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<F3>', ':NERDTreeToggle<CR>', {noremap=true, silent=true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff',builtin.find_files, {})
vim.keymap.set('n', '<leader>fg',builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb',builtin.buffers, {})
vim.keymap.set('n', '<leader>fh',builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd',builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>dl',builtin.quickfix, {})

vim.g.indentLine_setColors=0
vim.g.indentLine_char='┆'
local o = vim.o
local w = vim.wo
local b = vim.bo

vim.opt.autoindent = true
-- check this link for the nuances 
-- https://stackoverflow.com/questions/2490227/how-does-vims-autoread-work
vim.opt.autoread = true
vim.opt.backspace = "indent,eol,start"

vim.opt.bg = "dark"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"

-- on pressing tab, insert 4 spaces
vim.opt.expandtab = true
vim.opt.wildmenu = true
vim.opt.showmatch = true

-- give indicator on said line, could be comma separated too!
-- check documentation
-- vim.opt.colorcolumn=79

-- set new split buffer to the right of current one
vim.opt.splitright = true
-- set new vsplit buffer to the bottom of current one
vim.opt.splitbelow = true

-- set case insensitive on search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- search as character is entered
vim.opt.incsearch = true
vim.opt.fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
    eob = " ",
}
vim.opt.hlsearch = true

-- when indeting with >, use 4 spaces width
vim.opt.shiftwidth = 4
-- set visual tabs to have 4 spaces
vim.opt.tabstop = 4
-- show line number
w.number = true
-- set line number to relative linenumber
-- line number 0 on the cursor
w.relativenumber =true 

o.termguicolors=true
vim.cmd('colorscheme catppuccin')

-- vim.api.nvim_set_keymap('n', '')


-- soft break word. if a word is separated in 
-- lines because it reached edge of window 
vim.opt.linebreak = true
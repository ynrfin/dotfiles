require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- Git wrapper
    use 'tpope/vim-fugitive'

    -- auto close bracket
    use 'jiangmiao/auto-pairs'

    -- make surrounding words
    use 'tpope/vim-surround'

    -- Comment
    -- Plugin 'tpope/vim-commentary'
    use 'numToStr/Comment.nvim'

    -- vim plugins for theming
    use 'itchyny/lightline.vim'



    --Plugin 'Yggdroot/LeaderF'
    use 'nvim-lua/popup.nvim'
    -- use 'nvim-lua/plenary.nvim'
    use {'nvim-telescope/telescope.nvim', tag = "0.1.0", 
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use 'ThePrimeagen/harpoon'

    use 'scrooloose/nerdtree'

    use 'junegunn/goyo.vim'

    use 'altercation/Vim-colors-solarized'
    use 'morhetz/gruvbox'
    -- Plugin 'arcticicestudio/nord-vim'
    use 'shaunsingh/nord.nvim'
    use 'sainnhe/everforest'
    use 'rhysd/vim-color-spring-night'
    use {'catppuccin/nvim', as= "catppuccin"}

    -- For diagnostic text color because everforest could not cope with it
    use 'folke/lsp-colors.nvim'

    -- Mar kdown folding
    use 'godlygeek/tabular'
    use 'plasticboy/vim-markdown'

    use 'ryanoasis/vim-devicons'

    use 'Yggdroot/indentLine'

    -- show buffer list
    use 'akinsho/bufferline.nvim'

    -- LSP plugins
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp' -- The Engine
    use 'hrsh7th/cmp-buffer' -- completion from current buffer
    use 'hrsh7th/cmp-path' -- completion for path /
    use 'hrsh7th/cmp-cmdline' -- completion on commandline :
    use 'onsails/lspkind-nvim' -- completion indicator
    use 'ray-x/lsp_signature.nvim' -- function signature

    -- For luasnip users.
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- Better syntax higlighting
    use {'nvim-treesitter/nvim-treesitter', run= ':TSUpdate'}  -- We recommend updating the parsers on update

    use 'ray-x/go.nvim'
end)
call plug#begin('~/.config/nvim/autoload/plugged')

" Appearance
Plug 'joshdick/onedark.vim'
Plug 'myusuf3/numbers.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'folke/lsp-colors.nvim', { 'branch': 'main' }
Plug 'lukas-reineke/indent-blankline.nvim'

" Completion
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make', 'branch': 'main' }
Plug 'ray-x/lsp_signature.nvim'

" Niceties
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'

" Git
Plug 'lewis6991/gitsigns.nvim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Semantic language support
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main' }
Plug 'hrsh7th/cmp-git', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }

" Vsnip
Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
Plug 'hrsh7th/vim-vsnip'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'
Plug 'onsails/lspkind-nvim'

" Syntactic language support
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Nav
Plug 'preservim/nerdtree'

call plug#end()

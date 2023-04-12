local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  -- Appearance
  'joshdick/onedark.vim',
  'myusuf3/numbers.vim',
  'ap/vim-css-color',
  'kyazdani42/nvim-web-devicons',
  'machakann/vim-highlightedyank',
  'folke/lsp-colors.nvim',
  'lukas-reineke/indent-blankline.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' }
  },

  -- Completion
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- https://github.com/ray-x/lsp_signature.nvim#attach-the-plugin
  { 'ray-x/lsp_signature.nvim', opts = {} },

  -- https://github.com/numToStr/Comment.nvim#-installation
  { 'numToStr/Comment.nvim',    opts = {} },
  'tpope/vim-surround',
  'mg979/vim-visual-multi',

  -- Git
  { 'lewis6991/gitsigns.nvim', opts = {} },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'junegunn/gv.vim',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Semantic language support
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-refactor'
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-git',
  'hrsh7th/nvim-cmp',

  -- Useful status updates for LSP
  { 'j-hui/fidget.nvim',       opts = {} },

  -- LSP installer
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- Better search motions
  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' }
  },

  -- Luasnip
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",

  -- https://github.com/ray-x/navigator.lua#sample-vimrc-turning-your-neovim-into-a-full-featured-ide
  {
    'ray-x/navigator.lua',
    dependencies = {
      'ray-x/guihua.lua',
    },
    opts = {}
  },

  -- Syntactic language support
  'simrat39/rust-tools.nvim',
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- currently attaches 2 clients, needs fixing
  'mfussenegger/nvim-jdtls',

  -- Nav
  -- use 'preservim/nerdtree'
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    }
  },

  -- Undo
  'mbbill/undotree',

  -- Misc
  'ThePrimeagen/vim-be-good'

}, {})

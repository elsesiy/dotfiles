local overrides = require("custom.configs.overrides")

local plugins = {
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"mfussenegger/nvim-dap",
		init = function()
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = false,
		config = function(_, _)
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
			require("core.utils").load_mappings("dap_go")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("custom.configs.format")
		end,
		lazy = false,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("custom.configs.lint")
		end,
		lazy = false,
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
			require("core.utils").load_mappings("gopher")
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			return require("custom.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},

	-- Git
	{ "tpope/vim-fugitive", lazy = false },
	{ "tpope/vim-rhubarb", lazy = false },

	-- Better search motions
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		dependencies = { "tpope/vim-repeat" },
		lazy = false,
	},

	-- Lang specific plugins
	{ "mfussenegger/nvim-jdtls" },

	-- Misc
	{ "ThePrimeagen/vim-be-good", lazy = false },
	{ "machakann/vim-highlightedyank", lazy = false },
	---- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth", lazy = false },
	---- Undo
	{ "mbbill/undotree", lazy = false },
}
return plugins

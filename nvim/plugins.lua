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
		"mfussenegger/nvim-dap",
		init = function()
			require("core.utils").load_mappings("dap")
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

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			opts = function()
				return require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
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
	---- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth", lazy = false },
	---- Undo
	{ "mbbill/undotree", lazy = false },
}
return plugins

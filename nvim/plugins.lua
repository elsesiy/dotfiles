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
		"stevearc/conform.nvim",
		config = function()
			require("custom.configs.format")
		end,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("custom.configs.lint")
		end,
		event = { "BufReadPre", "BufNewFile" },
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
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "tpope/vim-rhubarb", event = "VeryLazy" },

	-- Better search motions
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		dependencies = { "tpope/vim-repeat" },
		event = "VeryLazy",
	},

	-- Mark files for faster navigation
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("core.utils").load_mappings("harpoon")
		end,
		event = "VeryLazy",
	},

	-- Git Worktree support
	{
		-- fork from ThePrimeagen/git-worktree with https://github.com/ThePrimeagen/git-worktree.nvim/pull/106
		"Clumsy-Coder/git-worktree.nvim",
		config = function()
			require("core.utils").load_mappings("git_worktree")
		end,
		event = "VeryLazy",
	},

	-- Lang specific plugins
	{ "mfussenegger/nvim-jdtls", ft = "java" },

	-- Misc
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{ "machakann/vim-highlightedyank", event = "VeryLazy" },
	---- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth", event = "VeryLazy" },
	---- Undo
	{ "mbbill/undotree", event = "VeryLazy" },
}
return plugins

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
		enabled = false,
	},
	{
		"NvChad/nvterm",
		enabled = false,
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
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = "rust",
		config = function(_, opts)
			require("core.utils").load_mappings("rustaceanvim")
			vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
		end,
		opts = function()
			return require("custom.configs.rustaceanvim")
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

	-- Better diagnostics
	{
		"folke/trouble.nvim",
		config = function()
			require("core.utils").load_mappings("trouble")
		end,
		event = "VeryLazy",
	},

	-- file explorer
	{
		"stevearc/oil.nvim",
		opts = function()
			return require("custom.configs.oil")
		end,
		config = function(_, _)
			require("core.utils").load_mappings("oil")
			require("custom.configs.oil")
		end,
		lazy = false,
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

	-- GenAI
	{
		"David-Kunz/gen.nvim",
		config = function()
			require("core.utils").load_mappings("gen")
		end,
		event = "VeryLazy",
	},

	-- Misc
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{ "machakann/vim-highlightedyank", event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	---- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth", event = "VeryLazy" },
	---- Undo
	{ "mbbill/undotree", event = "VeryLazy" },

	-- surround text objects
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- split/join objects, arrays, etc.
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "VeryLazy",
		config = function()
			require("treesj").setup()
			require("core.utils").load_mappings("treesj")
		end,
	},
}
return plugins

local overrides = require("configs.overrides")

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
		keys = {
			{
				"<leader>tr",
				"<cmd> Telescope resume <CR>",
				desc = "telescope resume",
			},
		},
		opts = overrides.telescope,
		-- https://github.com/ThePrimeagen/git-worktree.nvim/issues/122
		version = "0.1.5"
	},
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
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
		keys = {
			{
				"<leader>db",
				"<cmd> DapToggleBreakpoint <CR>",
				desc = "Add breakpoint at line",
			},
			{
				"<leader>dc",
				"<cmd> DapContinue <CR>",
				desc = "Debug: Start",
			},
			{
				"<leader>dsi",
				"<cmd> DapStepInto <CR>",
				desc = "Debug: Step into",
			},
			{
				"<leader>dso",
				"<cmd> DapStepOver <CR>",
				desc = "Debug: Step over",
			},
			{
				"<leader>do",
				"<cmd> DapStepOut <CR>",
				desc = "Debug: Step out",
			},
			{
				"<leader>dus",
				function()
					local widgets = require("dap.ui.widgets")
					local sidebar = widgets.sidebar(widgets.scopes)
					sidebar.open()
				end,
				desc = "Open debugging sidebar",
			},
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = false,
		config = function(_, opts)
			require("nvim-dap-virtual-text").setup(opts)
		end,
	},
	{
		"leoluz/nvim-dap-go",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
		dependencies = "mfussenegger/nvim-dap",
		ft = "go",
		keys = {
			{
				"<leader>dgt",
				function()
					require("dap-go").debug_test()
				end,
				desc = "Debug go test",
			},
			{
				"<leader>dgl",
				function()
					require("dap-go").debug_last()
				end,
				desc = "Debug last go test",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.format")
		end,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("configs.lint")
		end,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"olexsmir/gopher.nvim",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
		ft = "go",
		keys = {
			{
				"<leader>gsj",
				"<cmd> GoTagAdd json <CR>",
				desc = "Add json struct tags",
			},
			{
				"<leader>gsy",
				"<cmd> GoTagAdd yaml <CR>",
				desc = "Add yaml struct tags",
			},
		},
	},
	{
		"mrcjkb/rustaceanvim",
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
		end,
		ft = "rust",
		opts = function()
			return require("configs.rustaceanvim")
		end,
		keys = {
			{
				"<leader>rd",
				function()
					vim.cmd.RustLsp("debuggables")
				end,
				desc = "Rust debuggables",
			},
		},
		version = "^4",
	},

	-- Git
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "tpope/vim-rhubarb", event = "VeryLazy" },
	{
		"isak102/telescope-git-file-history.nvim",
		keys = {
			{
				"<leader>gh",
				function()
					require("telescope").extensions.git_file_history.git_file_history()
				end,
				desc = "View git file history",
			},
		},
	},
	-- Git Worktree support
	{
		-- fork from ThePrimeagen/git-worktree with https://github.com/ThePrimeagen/git-worktree.nvim/pull/106
		"Clumsy-Coder/git-worktree.nvim",
		keys = {
			{
				"<leader>ga",
				function()
					require("telescope").extensions.git_worktree.create_git_worktree()
				end,
				desc = "Create git worktree",
			},
			{
				"<leader>gl",
				function()
					require("telescope").extensions.git_worktree.git_worktrees()
				end,
				desc = "Show/Change git worktrees",
			},
		},
	},

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
		keys = {
			{
				"<leader>tx",
				function()
					require("trouble").toggle()
				end,
				desc = "trouble toggle",
			},
			{
				"<leader>tn",
				function()
					require("trouble").next({
						skip_groups = true,
						jump = true,
					})
				end,
				desc = "trouble next",
			},
			{
				"<leader>tp",
				function()
					require("trouble").previous({
						skip_groups = true,
						jump = true,
					})
				end,
				desc = "trouble previous",
			},
		},
	},

	-- file explorer
	{
		"stevearc/oil.nvim",
		config = function()
			require("configs.oil")
		end,
		lazy = false,
	},

	-- Lang specific plugins
	{ "mfussenegger/nvim-jdtls", ft = "java" },

	-- GenAI
	{
		"David-Kunz/gen.nvim",
		keys = {
			{
				"<leader>ge",
				":Gen<CR>",
				mode = { "n", "v" },
				desc = "Gen AI",
			},
		},
	},

	-- Misc
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{ "machakann/vim-highlightedyank", event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	---- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth", event = "VeryLazy" },

	---- Undo
	{
		"mbbill/undotree",
		keys = {
			{
				"<Leader>u",
				":UndotreeToggle<CR>",
				desc = "Undotree",
			},
		},
	},

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
		config = function()
			require("treesj").setup()
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		keys = {
			{
				"<leader>ts",
				"<cmd> TSJToggle <CR>",
				desc = "TreeSJ toggle",
			},
		},
	},

	-- hijack vim.ui.select to use Telescope instead
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},

	-- fix until https://github.com/neovim/neovim/issues/12517 lands to avoid files opening in quickfix and similar buffers
	{ "stevearc/stickybuf.nvim" },
}

return plugins

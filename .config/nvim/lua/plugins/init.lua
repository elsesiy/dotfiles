local overrides = require("configs.overrides")

local plugins = {
	-- override misc built-in plugin configs
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
		cmd = "Telescope",
		keys = {
			{
				"<leader>tr",
				"<cmd> Telescope resume <CR>",
				desc = "telescope resume",
			},
		},
		opts = overrides.telescope,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			return require("configs.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{
		"folke/which-key.nvim",
		opts = overrides.which_key,
	},

	-- disable misc built-in plugins
	{
		"nvim-tree/nvim-tree.lua",
		enabled = false,
	},
	{
		"NvChad/nvim-colorizer.lua",
		enabled = false,
	},

	-- other plugins
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
		opts = {},
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

	-- FZF
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

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
		"elsesiy/git-worktree.nvim",
		branch = "misc",
		config = function()
			local hooks = require("git-worktree.hooks")
			hooks.register(hooks.type.SWITCH, hooks.builtins.update_current_buffer_on_switch)
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
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
					require("telescope").extensions.git_worktree.git_worktree()
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
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
			{
				"<Leader>td",
				"<cmd> TodoTelescope <CR>",
				desc = "Search todo comments",
			},
		},
		opts = {},
	},

	-- file explorer
	{
		"mikavilpas/yazi.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = "VeryLazy",
		keys = {
			{
				"-",
				function()
					require("yazi").yazi()
				end,
				desc = "Open the file manager",
			},
			{
				"<leader>cw",
				function()
					require("yazi").yazi(nil, vim.fn.getcwd())
				end,
				desc = "Open the file manager in nvim's working directory",
			},
		},
		opts = {
			open_for_directories = true,
			hooks = {
				--- @diagnostic disable: unused-local
				yazi_closed_successfully = function(chosen_file, config, state)
					-- changes cwd when navigating in yazi without selecting a file
					if chosen_file == nil and state.last_directory.filename then
						vim.fn.chdir(state.last_directory.filename)
					end
				end,
			},
		},
	},

	-- Lang specific plugins
	{ "mfussenegger/nvim-jdtls", ft = "java" },

	-- Copilot
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		config = function()
			require("copilot_cmp").setup()
		end,
		dependencies = {
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			config = function()
				require("copilot").setup({
					suggestion = { enabled = false },
					panel = { enabled = false },
				})
			end,
		},
	},

	-- Misc
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{ "machakann/vim-highlightedyank", event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	---- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth", event = "VeryLazy" },

	-- Better folds
	{
		"kevinhwang91/nvim-ufo",
		event = "BufEnter",
		config = function()
			--- @diagnostic disable: unused-local
			require("ufo").setup({
				provider_selector = function(_bufnr, _filetype, _buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
		dependencies = {
			"kevinhwang91/promise-async",
		},
		keys = {
			{
				"zR",
				function()
					require("ufo").openAllFolds()
				end,
				"Open all folds",
			},
			{
				"zM",
				function()
					require("ufo").closeAllFolds()
				end,
				"Close all folds",
			},
			{
				"zV",
				function()
					require("ufo").peekFoldedLinesUnderCursor()
				end,
				"Peek folded lines",
			},
		},
	},

	-- Search & Replace
	{
		"nvim-pack/nvim-spectre",
		event = "VeryLazy",
		cmd = { "Spectre" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"catppuccin/nvim",
		},
		config = function()
			require("configs.spectre")
		end,
	},

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
	{
		"stevearc/stickybuf.nvim",
		opts = {},
	},

	-- highlight colors, replaces NvChad/nvim-colorizer.lua
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		opts = {
			exclude_buftypes = {
				"help",
				"prompt",
			},
			render = "virtual",
		},
	},

	{
		"gelguy/wilder.nvim",
		keys = {
			":",
			"/",
			"?",
		},
		dependencies = {
			"catppuccin/nvim",
		},
		config = function()
			require("configs.wilder")
		end,
	},
}

return plugins

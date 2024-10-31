local plugins = {
	-- override misc built-in plugin configs
	{
		"williamboman/mason.nvim",
		opts = {
			PATH = "prepend",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"awk",
				"bash",
				"cmake",
				"cpp",
				"css",
				"csv",
				"diff",
				"dockerfile",
				"editorconfig",
				"fish",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"gowork",
				"gpg",
				"graphql",
				"groovy",
				"hcl",
				"html",
				"http",
				"java",
				"javascript",
				"jq",
				"json",
				"jsonnet",
				"kdl",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"nix",
				"passwd",
				"pem",
				"promql",
				"proto",
				"python",
				"regex",
				"rust",
				"scss",
				"sql",
				"terraform",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			return require("configs.nvim-cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{
		"folke/which-key.nvim",
		opts = {
			show_help = false,
			show_keys = false,
		},
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
	{
		"windwp/nvim-autopairs",
		enabled = false,
	},

	-- other plugins
	{
		"neovim/nvim-lspconfig",
		config = function()
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

	-- Better search motions
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		dependencies = { "tpope/vim-repeat" },
		event = "VeryLazy",
	},

	-- Misc
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<Leader>ht",
				":Hardtime toggle<CR>",
				desc = "[h]ardtime [t]oggle",
			},
		},
		opts = {},
	},
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
				"<Leader>U",
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
				"<leader>j",
				"<cmd> TSJToggle <CR>",
				desc = "TreeSJ toggle",
			},
		},
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

	-- markdown support
	{
		"OXY2DEV/markview.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		ft = "markdown",
		keys = {
			{
				"<Leader>md",
				":Markview<CR>",
				desc = "Markview toggle",
			},
		},
	},

	-- highlight words under cursor
	{
		"echasnovski/mini.cursorword",
		event = "VeryLazy",
		config = function()
			require("mini.cursorword").setup()
		end,
		version = false,
	},

	-- more/enhanced treesitter textobjects
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup()
		end,
		version = false,
	},

	-- show visual separator for multiple windows
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinLeave" },
	},
}

return plugins

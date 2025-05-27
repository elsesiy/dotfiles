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
				"zig",
			},
		},
	},
	{
		"folke/which-key.nvim",
		opts = {
			show_help = false,
			show_keys = false,
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		keys = {
			{ "<leader>hP", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk inline" } },
			{ "<leader>hR", ":Gitsigns reset_buffer<CR>", { desc = "Reset buffer" } },
			{ "<leader>hp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" } },
			{ "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" } },
			{ "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" } },
			{ "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Unstage hunk" } },
			{ "[h", ":Gitsigns prev_hunk<CR>", { desc = "Previous git hunk" } },
			{ "]h", ":Gitsigns next_hunk<CR>", { desc = "Next git hunk" } },
		},
	},

	-- disable misc built-in plugins
	{
		"hrsh7th/nvim-cmp",
		enabled = false,
	},
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
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
	},
	{
		"nvim-telescope/telescope.nvim",
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
		"folke/flash.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
		specs = {
			{
				"folke/snacks.nvim",
				opts = {
					picker = {
						win = {
							input = {
								keys = {
									["<a-s>"] = { "flash", mode = { "n", "i" } },
									["s"] = { "flash" },
								},
							},
						},
						actions = {
							flash = function(picker)
								require("flash").jump({
									pattern = "^",
									label = { after = { 0, 0 } },
									search = {
										mode = "search",
										exclude = {
											function(win)
												return vim.bo[vim.api.nvim_win_get_buf(win)].filetype
													~= "snacks_picker_list"
											end,
										},
									},
									action = function(match)
										local idx = picker.list:row2idx(match.pos[1])
										picker.list:_move(idx, true, true)
									end,
								})
							end,
						},
					},
				},
			},
		},
	},

	-- Misc
	{ "ThePrimeagen/vim-be-good", event = "VeryLazy" },
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		keys = {
			{ "<Leader>ht", ":Hardtime toggle<CR>", desc = "[h]ardtime [t]oggle" },
		},
		opts = {},
	},
	{ "machakann/vim-highlightedyank", event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	---- Detect tabstop and shiftwidth automatically, maybe replace with faster alternatives
	{ "tpope/vim-sleuth", opts = {} },
	-- { "Darazaki/indent-o-matic", opts = {} },
  -- { "NMAC427/guess-indent.nvim", opts = {} },

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
			{ "zR", function() require("ufo").openAllFolds() end, "Open all folds" },
			{ "zM", function() require("ufo").closeAllFolds() end, "Close all folds" },
			{ "zV", function() require("ufo").peekFoldedLinesUnderCursor() end, "Peek folded lines" },
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
			{ "<leader>j", "<cmd> TSJToggle <CR>", desc = "TreeSJ toggle" },
		},
	},

	-- fix until https://github.com/neovim/neovim/issues/12517 lands to avoid files opening in quickfix and similar buffers
	{ "stevearc/stickybuf.nvim", opts = {} },

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

	-- markdown support
	{
		"OXY2DEV/markview.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		ft = "markdown",
		keys = { { "<Leader>md", ":Markview<CR>", desc = "Markview toggle" } },
	},

	-- highlight words under cursor
	{
		"echasnovski/mini.cursorword",
		config = function()
			require("mini.cursorword").setup()
		end,
		version = "*",
	},

	-- more/enhanced treesitter textobjects
	{
		"echasnovski/mini.ai",
		config = function()
			require("mini.ai").setup()
		end,
		version = "*",
	},

	-- show visual separator for multiple windows
	{
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinLeave" },
	},
}

return plugins

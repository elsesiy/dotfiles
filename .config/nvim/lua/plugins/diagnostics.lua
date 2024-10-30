return {
	-- Diagnostics explorer
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

	-- Support for TODO comments
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
				"<Leader>ft",
				"<cmd> TodoTelescope <CR>",
				desc = "[f]ind [t]odo comments",
			},
		},
		opts = {},
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			require("tiny-inline-diagnostic").setup()
		end,
	},

	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		config = function()
			require("tiny-code-action").setup({
				backend = "delta",
			})
		end,
	},
}

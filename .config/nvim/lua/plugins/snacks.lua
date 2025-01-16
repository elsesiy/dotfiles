return {
	{
		"folke/snacks.nvim",
		keys = {
			{ "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
			{ "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
			{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
			{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
			{ "<C-x>", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
			{ "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
			{ "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
			{ "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
			{
				"<leader>N",
				desc = "Neovim News",
				function()
					Snacks.win({
						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
						width = 0.6,
						height = 0.6,
						wo = {
							spell = false,
							wrap = false,
							signcolumn = "yes",
							statuscolumn = " ",
							conceallevel = 3,
						},
					})
				end,
			},
		},
		lazy = false,
		opts = {
			-- https://github.com/folke/snacks.nvim/blob/main/docs/bigfile.md
			bigfile = {
				enabled = true,
				notify = false,
				size = 500 * 1024, -- 500 KB
			},

			-- https://github.com/folke/snacks.nvim/blob/main/docs/debug.md
			debug = {
				enabled = true,
			},

			-- https://github.com/folke/snacks.nvim/blob/main/docs/dim.md
			dim = {
				enabled = true,
			},

			-- https://github.com/folke/snacks.nvim/blob/main/docs/gitbrowse.md
			gitbrowse = {
				notify = false,
			},


			-- https://github.com/folke/snacks.nvim/blob/main/docs/indent.md
			indent = {
				enabled = true,
			},

			-- https://github.com/folke/snacks.nvim/blob/main/docs/input.md
			input = {
				enabled = true,
			},

			-- https://github.com/folke/snacks.nvim/blob/main/docs/quickfile.md
			quickfile = {
				enabled = true,
			},

			-- https://github.com/folke/snacks.nvim/blob/main/docs/statuscolumn.md
			statuscolumn = {
				enabled = true,
			},

			-- https://github.com/folke/snacks.nvim/blob/main/docs/words.md
			words = {
				enabled = true,
			},

			-- https://github.com/folke/snacks.nvim/blob/main/docs/zen.md
			zen = {
				enabled = true,
			},

			-- disabled
			dashboard = { enabled = false },
			lazygit = { enabled = false },
			rename = { enabled = false },
			scope = { enabled = false },
			scroll = { enabled = false },
			toggle = { enabled = false },
			win = { enabled = false },
		},
		priority = 1000,
	},
}

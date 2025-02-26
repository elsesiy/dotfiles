return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-ui-select.nvim",
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		keys = {
			{
				"<leader>tr",
				"<cmd> Telescope resume <CR>",
				desc = "[t]elescope [r]esume",
			},
		},
		opts = {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"vendor",
				},
			},
			extensions_list = {
				"fzf",
				"git_file_history",
				"git_worktree",
				"ui-select",
			},
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_mru = true,
					mappings = {
						i = {
							["<c-x>"] = "delete_buffer",
						},
					},
				},
			},
		},
	},
}

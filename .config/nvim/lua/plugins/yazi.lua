return {
	{
		"mikavilpas/yazi.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
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
}

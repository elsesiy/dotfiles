return {
	"nvim-pack/nvim-spectre",
	cmd = { "Spectre" },
	config = function()
		require("configs.spectre")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"catppuccin/nvim",
	},
	keys = {
		{ "<Leader>R", function() require("spectre").toggle() end, "Replace globally via Spectre", },
		{ "<Leader>rw", function() require("spectre").open_visual({ select_word = true }) end, "Replace current word", },
		{ "<Leader>rf", function() require("spectre").open_file_search({ select_word = true }) end, "Replace in current file", },
		{ "<Leader>rw", "v", '<esc><cmd>lua require("spectre").open_visual()<CR>', "Search current word" },
	},
}

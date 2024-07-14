local present, spectre = pcall(require, "spectre")

if not present then
	return
end

local theme = require("catppuccin.palettes").get_palette("macchiato")

vim.api.nvim_set_hl(0, "SpectreSearch", { bg = theme.red, fg = theme.base })
vim.api.nvim_set_hl(0, "SpectreReplace", { bg = theme.green, fg = theme.base })

spectre.setup({
	highlight = {
		search = "SpectreSearch",
		replace = "SpectreReplace",
	},
	mapping = {
		["send_to_qf"] = {
			map = "<C-q>",
			cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
			desc = "send all items to quickfix",
		},
	},
})

---- keymaps -----
vim.keymap.set("n", "<leader>S", function()
	require("spectre").toggle()
end, {
	desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, {
	desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", function()
	require("spectre").open_file_search({ select_word = true })
end, {
	desc = "Search on current file",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})

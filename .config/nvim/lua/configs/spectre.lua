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

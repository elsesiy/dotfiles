---@type ChadrcConfig
local M = {}
M.ui = {
	statusline = {
		separator_style = "block",
		overriden_modules = function(modules)
			modules[11] = " Ln %l, Col %c"
		end,
	},
	theme = "catppuccin",
	transparency = true,
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
M.lazy_nvim = {
	performance = {
		rtp = {
			disabled_plugins = vim.tbl_filter(function(name)
				return string.sub(name, 1, 5) ~= "netrw"
			end, require("plugins.configs.lazy_nvim").performance.rtp.disabled_plugins),
		},
	},
}
return M

---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "catppuccin",
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

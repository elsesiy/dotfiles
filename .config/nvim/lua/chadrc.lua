local env = require("env")
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
}

M.ui = {
  statusline = {
    theme = "minimal",
  },
  tabufline = {
    enabled = false,
  },
}

M.lsp = {
  signature = false,
}

M.mason = {
  cmd = true,
  pkgs = env.mason_pkgs(),
}

return M

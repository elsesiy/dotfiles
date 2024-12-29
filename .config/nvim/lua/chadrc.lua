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

-- continue to use nvchads lsp signature help until blink is more mature
-- M.lsp = {
-- 	signature = false,
-- }

M.mason = {
	cmd = true,
	pkgs = {
		-- dap
		"delve",
		"java-debug-adapter",
		"java-test",

		-- lsp
		"bash-language-server",
		"gopls",
		"jdtls",
		"lua-language-server",
		"nil",
		"ruff",
		"terraform-ls",
		"yaml-language-server",

		-- formatting
		"gofumpt",
		"goimports",
		"google-java-format",
		"shfmt",
		"stylua",
		"yamlfix",

		-- lint
		"golangci-lint",
		"shellcheck",
		"sqlfluff",
		"tflint",
		"tfsec",
		"yamllint",

		-- spelling
		"codespell",
	},
}

return M

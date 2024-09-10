---@type ChadrcConfig
local M = {}

M.ui = {
	statusline = {
		theme = "minimal",
	},
	tabufline = {
		enabled = false,
	},
	theme = "catppuccin",
	transparency = true,
}

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

local M = {}

M.mason = {
	ensure_installed = {
		-- dap
		"delve",

		-- lsp
		"bash-language-server",
		"gopls",
		"jdtls",
		"lua-language-server",
		"terraform-ls",
		"rust-analyzer",
		"yaml-language-server",

		-- formatting
		"gofumpt",
		"goimports",
		"jq",
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

M.treesitter = {
	ensure_installed = {
		"bash",
		"dockerfile",
		"go",
		"gomod",
		"hcl",
		"java",
		"json",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"proto",
		"rust",
		"sql",
		"terraform",
		"vim",
		"vimdoc",
		"yaml",
	},
}

M.telescope = {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"vendor",
		},
		prompt_prefix = " 🔍 ",
	},
	extensions_list = { "git_worktree" },
}

return M

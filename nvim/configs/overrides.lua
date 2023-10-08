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
		"prettier",
		"shfmt",
		"yamlfmt",

		-- lint
		"golangci-lint",
		"shellcheck",
		"sqlfluff",
		"tflint",
		"tfsec",
		"yamllint",
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
	},
	extensions_list = { "fzf", "git_worktree", "harpoon", "themes", "terms" },
}

M.nvimtree = {
	disable_netrw = false,
	hijack_netrw = false,
}

return M

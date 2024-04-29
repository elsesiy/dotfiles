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
	extensions_list = { "git_file_history", "git_worktree", "ui-select" },
}

M.cmp = {
	enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
}

return M

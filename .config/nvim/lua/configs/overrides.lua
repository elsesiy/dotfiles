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
		"nil",
		"ruff",
		"terraform-ls",
		"yaml-language-server",

		-- formatting
		"gofumpt",
		"goimports",
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
	PATH = "prepend",
}

M.treesitter = {
	ensure_installed = {
		"awk",
		"bash",
		"cmake",
		"cpp",
		"css",
		"csv",
		"diff",
		"dockerfile",
		"editorconfig",
		"fish",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"gotmpl",
		"gowork",
		"gpg",
		"graphql",
		"groovy",
		"hcl",
		"html",
		"http",
		"java",
		"javascript",
		"jq",
		"json",
		"jsonnet",
		"kdl",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"nix",
		"passwd",
		"pem",
		"promql",
		"proto",
		"python",
		"regex",
		"rust",
		"scss",
		"sql",
		"terraform",
		"typescript",
		"vim",
		"vimdoc",
		"xml",
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
	extensions_list = {
		"fzf",
		"git_file_history",
		"git_worktree",
		"ui-select",
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_mru = true,
			mappings = {
				i = {
					["<c-x>"] = "delete_buffer",
				},
			},
		},
	},
}

M.which_key = {
	show_help = false,
	show_keys = false,
}

M.cmp = {
	enabled = function()
		-- disable completion for prompts such as telescope
		if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
			return false
		end

		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		end

		-- disable completion in comments
		local context = require("cmp.config.context")
		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
	end,
}

return M

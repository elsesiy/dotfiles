local present, conform = pcall(require, "conform")

if not present then
	return
end

local opts = {
	formatters_by_ft = {
		go = { "gofumpt", "goimports" },
		json = { "jq" },
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format", "ruff_fix" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		terraform = { "terraform_fmt" },
		yaml = { "yamlfix" },
		["_"] = { "codespell" },
		["*"] = { "trim_newlines" },
	},
	formatters = {
		yamlfix = {
			env = {
				YAMLFIX_SEQUENCE_STYLE = "keep_style",
			},
		},
	},
	lsp_fallback = true,
}

conform.setup(opts)

---- keymaps -----
vim.keymap.set("n", "<leader>fm", function()
	conform.format({
		async = true,
	})
end, {
	desc = "Format file",
})

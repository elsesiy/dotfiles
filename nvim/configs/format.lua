local present, conform = pcall(require, "conform")

if not present then
	return
end

conform.formatters_by_ft = {
	go = { "gofumpt", "goimports" },
	json = { "jq" },
	lua = { "stylua" },
	rust = { "rustfmt" },
	sh = { "shfmt" },
	terraform = { "terraform_fmt" },
	yaml = { "yamlfix" },
	["*"] = { "codespell", "trim_newlines" },
}

-- customize yaml formatter
require("conform.formatters.yamlfix").env = {
	YAMLFIX_SEQUENCE_STYLE = "block_style",
}

local present, lint = pcall(require, "lint")

if not present then
	return
end

lint.linters_by_ft = {
	go = { "golangcilint" },
	sh = { "shellcheck" },
	terraform = { "tflint", "tfsec" },
	sql = { "sqlfluff" },
	yaml = { "yamllint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})

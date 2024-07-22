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

local lint_g = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_g,
	callback = function()
		lint.try_lint()
	end,
})

---- keymaps -----
vim.keymap.set("n", "<leader>fl", function()
	lint.try_lint()
end, {
	desc = "Lint file",
})

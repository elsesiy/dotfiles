return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>fl", function() require("lint").try_lint() end, desc = "Lint file" },
	},
  config = function()
    require("lint").linters_by_ft = {
			dockerfile = { "hadolint" },
			go = { "golangcilint" },
			sh = { "shellcheck" },
			terraform = { "tflint", "tfsec" },
			sql = { "sqlfluff" },
			yaml = { "yamllint" },
		}
  end,
}

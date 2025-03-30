return {
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			{
				"leoluz/nvim-dap-go",
				opts = {},
			},
		},
	},
	{
		"nvim-neotest/neotest",
		optional = true,
		dependencies = {
			"fredrikaverpil/neotest-golang",
		},
		opts = {
			adapters = {
				["neotest-golang"] = {
					-- Here we can set options for neotest-golang, e.g.
					-- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
					dap_go_enabled = true, -- requires leoluz/nvim-dap-go
				},
			},
		},
	},

	{
		"olexsmir/gopher.nvim",
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
		ft = "go",
		keys = {
			{ "<leader>gsj", "<cmd>GoTagAdd json<CR>", desc = "Add json struct tags" },
			{ "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", desc = "Add yaml struct tags" },
		},
		opts = {},
	},

	-- Show interface implementations
	{
		"maxandron/goplements.nvim",
		ft = "go",
		opts = {},
	},
}

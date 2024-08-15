return {
	{
		"mrcjkb/rustaceanvim",
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
		end,
		ft = "rust",
		opts = function()
			return require("configs.rustaceanvim")
		end,
		keys = {
			{
				"<leader>rd",
				function()
					vim.cmd.RustLsp("debuggables")
				end,
				desc = "Rust debuggables",
			},
		},
		version = "^4",
	},
}

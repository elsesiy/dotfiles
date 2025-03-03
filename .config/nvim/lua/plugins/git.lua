return {
	-- Git integration
	{ "tpope/vim-fugitive", event = "VeryLazy" },

	-- GitHub extension
	{ "tpope/vim-rhubarb", event = "VeryLazy" },

  -- TODO: write snacks integration
	-- Git Worktree support
	-- {
	-- 	"elsesiy/git-worktree.nvim",
	-- 	branch = "misc",
	-- 	config = function()
	-- 		local hooks = require("git-worktree.hooks")
	-- 		hooks.register(hooks.type.SWITCH, hooks.builtins.update_current_buffer_on_switch)
	-- 	end,
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	keys = {
	-- 		{
	-- 			"<leader>gw",
	-- 			function()
	-- 				require("telescope").extensions.git_worktree.create_git_worktree()
	-- 			end,
	-- 			desc = "Create git worktree",
	-- 		},
	-- 		{
	-- 			"<leader>gl",
	-- 			function()
	-- 				require("telescope").extensions.git_worktree.git_worktree()
	-- 			end,
	-- 			desc = "Show/Change git worktrees",
	-- 		},
	-- 	},
	-- },
}

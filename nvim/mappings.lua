local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
	},
}

M.dap_go = {
	plugin = true,
	n = {
		["<leader>dgt"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug go test",
		},
		["<leader>dgl"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug last go test",
		},
	},
}

M.disabled = {
	-- disable line number toggle mappings
	n = {
		["<leader>n"] = "",
		["<leader>rn"] = "",
		["<leader>th"] = "",
	},
}

M.general = {
	n = {
		["-"] = {
			"<CMD>Oil<CR>",
			"Open parent directory",
		},
		["<Leader>u"] = {
			":UndotreeToggle<CR>",
			"Undotree",
		},
		["<C-d>"] = {
			"<C-d>zz",
			"center down",
		},
		["<C-u>"] = {
			"<C-u>zz",
			"center up",
		},
		["n"] = {
			"nzzzv",
			"center forward search",
		},
		["N"] = {
			"Nzzzv",
			"center backward search",
		},
		["<Leader>Y"] = { '"+Y', "", opts = { noremap = true } },
		["<Leader>y"] = { '"+y', "" },
		["<Leader>d"] = { '"_d', "" },
		["<leader>fl"] = {
			function()
				require("lint").try_lint()
			end,
			"Lint file",
		},
		["<leader>fm"] = {
			function()
				require("conform").format({
					lsp_fallback = true,
					timeout_ms = 5000,
				})
			end,
			"Format file",
		},
	},
	x = {
		["<Leader>p"] = { '"_dP', "" },
	},
	v = {
		["<Leader>y"] = { '"+y', "" },
		["<Leader>d"] = { '"_d', "" },
	},
}

M.gopher = {
	plugin = true,
	n = {
		["<leader>gsj"] = {
			"<cmd> GoTagAdd json <CR>",
			"Add json struct tags",
		},
		["<leader>gsy"] = {
			"<cmd> GoTagAdd yaml <CR>",
			"Add yaml struct tags",
		},
	},
}

M.git_worktree = {
	plugin = true,
	n = {
		["<leader>ga"] = {
			function()
				require("telescope").extensions.git_worktree.create_git_worktree()
			end,
			"Create git worktree",
		},
		["<leader>gl"] = {
			function()
				require("telescope").extensions.git_worktree.git_worktrees()
			end,
			"Show/Change git worktrees",
		},
	},
}

M.harpoon = {
	plugin = true,
	n = {
		["<leader>a"] = {
			function()
				require("harpoon.mark").add_file()
			end,
			"Add to harpoon",
		},
		["<leader>rm"] = {
			function()
				require("harpoon.mark").rm_file()
			end,
			"Remove from harpoon",
		},
		["<C-e>"] = {
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Current marks",
		},
		["<leader>H"] = {
			function()
				require("harpoon.ui").nav_file(1)
			end,
			"Navigate to file 1",
		},
		["<leader>T"] = {
			function()
				require("harpoon.ui").nav_file(2)
			end,
			"Navigate to file 2",
		},
		["<leader>N"] = {
			function()
				require("harpoon.ui").nav_file(3)
			end,
			"Navigate to file 3",
		},
		["<leader>S"] = {
			function()
				require("harpoon.ui").nav_file(4)
			end,
			"Navigate to file 4",
		},
	},
}

M.telescope = {
	plugin = true,
	n = {
		["<leader>ma"] = { "<cmd> Telescope harpoon marks <CR>", "telescope bookmarks" },
	},
}

M.oil = {
	plugin = true,
	n = {
		["<leader>ff"] = {
			function()
				require("telescope.builtin").find_files({ cwd = require("oil").get_current_dir() })
			end,
			{ buffer = bufnr },
		},
	},
}

return M

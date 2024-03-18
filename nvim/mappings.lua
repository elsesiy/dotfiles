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

M.gen = {
	plugin = true,
	n = {
		["<leader>ge"] = { ":Gen<CR>", "Gen AI" },
	},
	v = {
		["<leader>ge"] = { ":Gen<CR>", "Gen AI" },
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
					async = true,
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

M.git_file_history = {
	plugin = true,
	n = {
		["<leader>gh"] = {
			function()
				require("telescope").extensions.git_file_history.git_file_history()
			end,
			"View git file history",
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

M.telescope = {
	plugin = true,
	n = {
		["<leader>tr"] = { "<cmd> Telescope resume <CR>", "telescope resume" },
	},
}

M.treesj = {
	plugin = true,
	n = {
		["<leader>ts"] = { "<cmd> TSJToggle <CR>", "TreeSJ toggle" },
	},
}

M.trouble = {
	plugin = true,
	n = {
		["<leader>tx"] = {
			function()
				require("trouble").toggle()
			end,
			"trouble toggle",
		},
		["<leader>tn"] = {
			function()
				require("trouble").next({ skip_groups = true, jump = true })
			end,
			"trouble next",
		},
		["<leader>tp"] = {
			function()
				require("trouble").previous({ skip_groups = true, jump = true })
			end,
			"trouble previous",
		},
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
		["<C-q>"] = {
			function()
				if vim.bo.filetype ~= "oil" then
					return
				end
				local oil = require("oil")
				local dir = oil.get_current_dir()

				local entries = {}
				for i = 1, vim.fn.line("$") do
					local entry = oil.get_entry_on_line(0, i)
					if entry and entry.type == "file" then
						table.insert(entries, { filename = dir .. entry.name })
					end
				end
				if #entries == 0 then
					return
				end

				vim.fn.setqflist(entries)
				return vim.cmd.copen()
			end,
		},
	},
}

M.rustaceanvim = {
	plugin = true,
	n = {
    ["<leader>rd"] = { function() vim.cmd.RustLsp("debuggables") end, "Rust debuggables" },
	},
}

return M

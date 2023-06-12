local M = {}

M.disabled = {
	-- disable line number toggle mappings
	n = {
		["<leader>n"] = "",
		["<leader>rn"] = "",
	},
}

M.general = {
	n = {
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
	},
	x = {
		["<Leader>p"] = { '"_dP', "" },
	},
	v = {
		["<Leader>y"] = { '"+y', "" },
		["<Leader>d"] = { '"_d', "" },
	},
}

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

return M

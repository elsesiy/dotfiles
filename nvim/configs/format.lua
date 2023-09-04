local M = {
	filetype = {
		go = {
			require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").gofumpt,
		},

		json = {
			require("formatter.filetypes.json").jq,
		},

		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},

		sh = {
			require("formatter.filetypes.sh").shfmt,
		},

		terraform = {
			require("formatter.filetypes.terraform").terraformfmt,
		},

		yaml = {
			function()
				return {
					exe = "yamlfmt",
					args = {
						"-formatter",
						"include_document_start=true",
						"-in",
					},
					stdin = true,
				}
			end,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
}

return M

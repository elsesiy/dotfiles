local present, formatter = pcall(require, "formatter")

if not present then
	return
end

local opts = {
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
			require("formatter.filetypes.yaml").yamlfmt,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
}

formatter.setup(opts)

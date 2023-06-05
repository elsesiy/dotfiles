local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
	bashls = {},
	gopls = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	jdtls = {},
	terraformls = {},
	lua_ls = {
	    Lua = {
	        workspace = { checkThirdParty = false },
	        telemetry = { enable = false },
	    },
	},
	rust_analyzer = {},
	yamlls = {
		yaml = {
			format = {
				enable = false,
				singleQuote = true,
			},
		},
	},
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.gopls.setup({
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

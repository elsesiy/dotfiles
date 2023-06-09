local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
	"bashls",
	"gopls",
	"jdtls",
	"terraformls",
	"lua_ls",
	"rust_analyzer",
	"yamlls",
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
			staticcheck = true,
		},
	},
})

lspconfig.lua_ls.setup({
	Lua = {
		workspace = { checkThirdParty = false },
		telemetry = { enable = false },
	},
})

lspconfig.yamlls.setup({
	yaml = {
		format = {
			enable = false,
			singleQuote = true,
		},
	},
})

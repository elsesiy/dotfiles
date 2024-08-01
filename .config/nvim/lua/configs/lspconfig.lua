local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
	"bashls",
	"ruff",
	"terraformls",

	-- "jdtls" # managed via nvim-jdtls ft
	-- "rust_analyzer" # managed via rustaceanvim
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	on_init = on_init,
	settings = {
		gopls = {
			analyses = {
				unusedvariable = true,
				useany = true,
			},
			completeUnimported = true,
			gofumpt = true,
			-- ref: https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			staticcheck = true,
			usePlaceholders = true,
			vulncheck = "Imports",
		},
	},
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	on_init = on_init,
	settings = {
		Lua = {
			hint = {
				enable = true,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = { enable = false },
		},
	},
})

lspconfig.yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	on_init = on_init,
	yaml = {
		format = {
			enable = false,
			singleQuote = true,
		},
	},
})

---- keymaps -----
vim.keymap.set("n", "<leader>I", function()
	--- @diagnostic disable: missing-parameter
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {
	desc = "Toggle inlay hints",
})

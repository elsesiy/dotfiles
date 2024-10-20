local nvlsp = require("nvchad.configs.lspconfig")
local lspconfig = require("lspconfig")

nvlsp.defaults()

local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities

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

---- lsp customization ----
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = {
		{ "╭", "Comment" },
		{ "─", "Comment" },
		{ "╮", "Comment" },
		{ "│", "Comment" },
		{ "╯", "Comment" },
		{ "─", "Comment" },
		{ "╰", "Comment" },
		{ "│", "Comment" },
	},
	-- hide 'No information available' message
	silent = true,
})

---- keymaps -----
vim.keymap.set("n", "<leader>I", function()
	--- @diagnostic disable: missing-parameter
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {
	desc = "Toggle inlay hints",
})

---- override NvChad defaults for diagnostics config ----
vim.diagnostic.config({ virtual_text = false })

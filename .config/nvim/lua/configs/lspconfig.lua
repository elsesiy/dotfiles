local capabilities = require("blink.cmp").get_lsp_capabilities()
local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

nvlsp.defaults()

local servers = {
  "bashls",
  "dockerls",
  "docker_compose_language_service",
  "ruff",
  "terraformls",
  "zls",

  -- "jdtls" # managed via nvim-jdtls ft
  -- "rust_analyzer" # managed via rustaceanvim
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
  })
end

lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
  on_init = function(client, _)
    -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
    if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
      local semantic = client.config.capabilities.textDocument.semanticTokens
      client.server_capabilities.semanticTokensProvider = {
        full = true,
        legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
        range = true,
      }
    end
  end,

  settings = {
    gopls = {
      analyses = {
        nilness = true,
        ST1000 = false, -- disable https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md#st1000-incorrect-or-missing-package-comment
        unusedparams = true,
        unusedvariable = true,
        unusedwrite = true,
        useany = true,
      },
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
        vulncheck = true,
      },
      completeUnimported = true,
      directoryFilters = {
        "-.git",
        "-.vscode",
        "-.idea",
        "-.vscode-test",
        "-**/node_modules",
        "-**/testdata",
      },
      gofumpt = true,
      -- ref: https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = false,
        compositeLiteralTypes = false,
        constantValues = false,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      semanticTokens = true,
      staticcheck = true,
      usePlaceholders = true,
      vulncheck = "Imports",
    },
  },
})

lspconfig.yamlls.setup({
  capabilities = capabilities,
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,

  yaml = {
    format = {
      enable = false,
      singleQuote = true,
    },
  },
})

lspconfig.zls.setup({
  capabilities = capabilities,
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  settings = {
    zls = {
      semantic_tokens = "partial",
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
vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = true,
  underline = true,
  virtual_text = false,
})

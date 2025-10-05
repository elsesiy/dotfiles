local nv_on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local on_attach = function(client, buffer)
  nv_on_attach(client, buffer)
  vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
end

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          buildScripts = {
            enable = true,
          },
        },
        -- Add clippy lints for Rust.
        check = {
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        inlayHints = {
          bindingModeHints = {
            enable = false,
          },
          chainingHints = {
            enable = true,
          },
          closingBraceHints = {
            enable = true,
            minLines = 25,
          },
          closureReturnTypeHints = {
            enable = "never",
          },
          lifetimeElisionHints = {
            enable = "never",
            useParameterNames = false,
          },
          maxLength = 25,
          parameterHints = {
            enable = true,
          },
          reborrowHints = {
            enable = "never",
          },
          renderColons = true,
          typeHints = {
            enable = true,
            hideClosureInitialization = false,
            hideNamedConstructor = false,
          },
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      },
    },
  },
}

return options

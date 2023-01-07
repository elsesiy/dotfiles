-- lsp configs
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.gopls.setup {
    capabilities = capabilities,
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    init_options = {
        usePlaceholders = true,
    }
}

lspconfig.terraformls.setup {
    capabilities = capabilities,
}

lspconfig.bashls.setup {
    capabilities = capabilities,
}

lspconfig.yamlls.setup {
    capabilities = capabilities,
    settings = {
        yaml = {
            format = {
                enable = false,
                singleQuote = true,
            },
        },
    },
}

require 'rust-tools'.setup {
    server = {
        capabilities = capabilities,
    },
}

-- https://github.com/ray-x/go.nvim#installation
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp,
})
require('go').setup()

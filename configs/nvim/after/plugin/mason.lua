require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        'bashls',
        'gopls',
        'terraformls',
        'sumneko_lua',
        'rust_analyzer',
        'yamlls',
    },
}

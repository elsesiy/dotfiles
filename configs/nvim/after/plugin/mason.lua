require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        'bashls',
        'gopls',
        'jdtls',
        'terraformls',
        'sumneko_lua',
        'rust_analyzer',
        'yamlls',
    },
}

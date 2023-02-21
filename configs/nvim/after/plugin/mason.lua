require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        'bashls',
        'gopls',
        'jdtls',
        'terraformls',
        'lua_ls',
        'rust_analyzer',
        'yamlls',
    },
}

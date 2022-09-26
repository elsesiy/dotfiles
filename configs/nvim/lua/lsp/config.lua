-- lsp configs
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.rust_analyzer.setup{
    capabilities=capabilities,
    on_attach=on_attach
}

require'lspconfig'.gopls.setup{
    on_attach=on_attach,
    capabilities=capabilities,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

require'lspconfig'.terraformls.setup{
    capabilities=capabilities,
    on_attach=on_attach
}

require'lspconfig'.bashls.setup{
    capabilities=capabilities,
    on_attach=on_attach
}

-- add | indent https://github.com/lukas-reineke/indent-blankline.nvim
require'indent_blankline'.setup {
    char = "",
    context_char = "│",
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = {'NvimTree'},
}

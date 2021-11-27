-- lsp configs
require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }

require'lspconfig'.gopls.setup{
    on_attach=on_attach,
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

require'lspconfig'.terraformls.setup{ on_attach=on_attach }
require'lspconfig'.bashls.setup{ on_attach=on_attach }

-- https://github.com/ray-x/navigator.lua#sample-vimrc-turning-your-neovim-into-a-full-featured-ide
require'navigator'.setup()

-- https://github.com/ray-x/lsp_signature.nvim#attach-the-plugin
require'lsp_signature'.setup()

-- add pictograms to built-in lsp https://github.com/onsails/lspkind-nvim
require'lspkind'.init()

-- add | indent https://github.com/lukas-reineke/indent-blankline.nvim
require'indent_blankline'.setup {
    buftype_exclude = {"help", "terminal"}
}

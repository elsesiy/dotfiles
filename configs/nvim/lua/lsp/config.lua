-- lsp configs
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.gopls.setup{
    on_attach=on_attach,
    capabilities=capabilities,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
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

lspconfig.terraformls.setup{
    capabilities=capabilities,
    on_attach=on_attach
}

lspconfig.bashls.setup{
    capabilities=capabilities,
    on_attach=on_attach
}


lspconfig.yamlls.setup {
    capabilities=capabilities,
    on_attach=on_attach
}

require'rust-tools'.setup {
  server = {
    capabilities=capabilities,
    on_attach=on_attach
  },
}

-- add | indent https://github.com/lukas-reineke/indent-blankline.nvim
require'indent_blankline'.setup {
    char = "",
    context_char = "│",
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = {'NvimTree'},
}

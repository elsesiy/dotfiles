-- https://github.com/hrsh7th/nvim-cmp#recommended-configuration
local cmp = require'cmp'
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
       if cmp.visible() then
         cmp.select_next_item()
       elseif vim.fn["vsnip#available"](1) then
         vim.fn.feedkeys(t('<Plug>(vsnip-expand-or-jump)', ''))
       else
         fallback()
       end
     end, {
       "i",
       "s"
     }),
     ['<S-Tab>'] = function(fallback)
       if cmp.visible() then
         cmp.select_prev_item()
       elseif vim.fn["vsnip#jumpable"](-1) then
         vim.fn.feedkeys(t('<Plug>(vsnip-jump-prev)', ''))
       else
         fallback()
       end
     end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
  cmp.setup.buffer { completion = {enable = false} }
end

-- :h nvim-treesitter-modules
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}

-- https://github.com/nvim-telescope/telescope-fzf-native.nvim#telescope-setup-and-configuration
require('telescope').setup {}
require('telescope').load_extension('fzf')

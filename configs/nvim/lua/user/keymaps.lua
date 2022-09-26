-- TAB in general mode will move to text buffer
vim.keymap.set('n', '<TAB>', ':bnext<CR>')

-- SHIFT-TAB will go back
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>')

-- Better tabbing
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<Leader>o', 'o<Esc>^Da')
vim.keymap.set('n', '<Leader>O', 'O<Esc>^Da')

-- nerd tree
vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>')


-- " vsnip
-- " Expand
-- imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
-- smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

-- " Expand or jump
-- imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
-- smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

-- " Jump forward or backward
-- imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
-- smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

-- telescope
vim.keymap.set('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>fg', '<Cmd>Telescope git_commits<CR>')
vim.keymap.set('n', '<Leader>fz', '<Cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>')

-- show undo tree
vim.keymap.set('n', '<Leader>u', ':UndotreeToggle<CR>')

-- clipboard ops
vim.keymap.set('x', '<Leader>p', '\"_dP')
vim.keymap.set('n', '<Leader>Y', '\"+Y', {noremap=false})
vim.keymap.set('n', '<Leader>y', '\"+y')
vim.keymap.set('v', '<Leader>y', '\"+y')
vim.keymap.set('n', '<Leader>d', '\"_d')
vim.keymap.set('v', '<Leader>d', '\"_d')

-- format
vim.keymap.set('n', '<Leader>fmt', function()
    vim.lsp.buf.format()
end)

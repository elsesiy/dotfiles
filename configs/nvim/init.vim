source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/appearance.vim
source $HOME/.config/nvim/langs.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/nerdtree.vim

lua require('lsp')
lua require('autocomplete')
" TODO lualine https://github.com/hoob3rt/lualine.nvim

" https://github.com/lewis6991/gitsigns.nvim#usage
lua require('gitsigns').setup()

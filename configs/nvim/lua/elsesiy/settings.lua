-- Set leader key
vim.g.mapleader=" "
-- Always use same cursor style
vim.opt.guicursor=""
-- Required to keep multiple buffers open multiple buffers
vim.opt.hidden=true
-- Display long lines as just one line
vim.opt.wrap=false
-- The encoding written to file
vim.opt.fileencoding="utf-8"
-- Show the cursor position all the time
vim.opt.ruler=true
-- Treat dash separated words as a word text object
vim.opt.iskeyword:append("-")
-- Horizontal splits will automatically be below
vim.opt.splitbelow=true
-- Vertical splits will automatically be to the right
vim.opt.splitright=true
-- So that I can see `` in markdown files
vim.opt.conceallevel=0
-- Insert 4 spaces for a tab
vim.opt.tabstop=4
-- Move 4 columns when tabbing
vim.opt.softtabstop=4
-- Change the number of space characters inserted for indentation
vim.opt.shiftwidth=4
-- Converts tabs to spaces
vim.opt.expandtab=true
-- Always display the status line
vim.opt.laststatus=0
-- Line numbers
vim.opt.number=true
-- Enable highlighting of the current line
vim.opt.cursorline=true
-- Tell vim what the background color looks like
vim.opt.background="dark"
-- Always show tabs
vim.opt.showtabline=2
-- Keep min 8 lines before/after before scrolling
vim.opt.scrolloff=8
-- Always show sign column
vim.opt.signcolumn="yes"
-- Visual column for line length
vim.opt.colorcolumn="80"
-- Don't create file backups
vim.opt.backup=false
-- Persistent undotree
vim.opt.undodir=os.getenv("HOME") .. "/.vim/undodir"
-- Create undo file to record changes
vim.opt.undofile=true
-- We don't need to see things like -- INSERT -- anymore
vim.opt.showmode=false
-- Faster completion
vim.opt.updatetime=50
-- Stop newline continution of comments
vim.opt.formatoptions:remove("c", "r", "o")
-- Disable clipboard
vim.opt.clipboard=""
-- nvim-cmp
vim.opt.completeopt= {'menu', 'menuone', 'noselect'}

-- color scheme & syntax highlighting
vim.opt.termguicolors = true
vim.cmd [[
  syntax enable
  colorscheme onedark
]]

-- Disable theme toggle
vim.g.toggle_theme_icon = ""
-- Enable virtual text inlining for DAP
vim.g.dap_virtual_text = true
-- Use relative line numbers
vim.opt.rnu = true
-- Always use same cursor style
vim.opt.guicursor = ""
-- Display long lines as just one line
vim.opt.wrap = false
-- The encoding written to file
vim.opt.fileencoding = "utf-8"
-- Show the cursor position all the time
vim.opt.ruler = true
-- Treat dash separated words as a word text object
vim.opt.iskeyword:append("-")
-- So that I can see `` in markdown files
vim.opt.conceallevel = 0
-- Keep min 8 lines before/after before scrolling
vim.opt.scrolloff = 8
-- Visual column for line length
vim.opt.colorcolumn = "80"
-- Don't create file backups
vim.opt.backup = false
-- Persistent undotree
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Stop newline continution of comments
vim.opt.formatoptions:remove("c", "r", "o")
-- Disable clipboard
vim.opt.clipboard = ""

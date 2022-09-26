-- set leader key
vim.g.mapleader = " "

vim.opt.hidden=true                                  -- Required to keep multiple buffers open multiple buffers
vim.opt.wrap=false                                   -- Display long lines as just one line
vim.opt.fileencoding="utf-8"                         -- The encoding written to file
vim.opt.ruler= true                                  -- Show the cursor position all the time
vim.opt.iskeyword:append("-")                        -- treat dash separated words as a word text object
vim.opt.mouse="a"                                    -- Enable your mouse
vim.opt.splitbelow=true                              -- Horizontal splits will automatically be below
vim.opt.splitright=true                              -- Vertical splits will automatically be to the right
vim.opt.conceallevel=0                               -- So that I can see `` in markdown files
vim.opt.tabstop=4                                    -- Insert 4 spaces for a tab
vim.opt.softtabstop=4                                -- Move 4 columns when tabbing
vim.opt.shiftwidth=4                                 -- Change the number of space characters inserted for indentation
vim.opt.expandtab=true                               -- Converts tabs to spaces
vim.opt.laststatus=0                                 -- Always display the status line
vim.opt.number=true                                  -- Line numbers
vim.opt.cursorline=true                              -- Enable highlighting of the current line
vim.opt.background="dark"                            -- tell vim what the background color looks like
vim.opt.showtabline=2                                -- Always show tabs
vim.opt.backup=false                                 -- This is recommended by coc
vim.opt.showmode=false                               -- We don't need to see things like -- INSERT -- anymore
vim.opt.writebackup=false                            -- This is recommended by coc
vim.opt.updatetime=50                                -- Faster completion
vim.opt.timeoutlen=500                               -- By default timeoutlen is 1000 ms
vim.opt.formatoptions:remove("c", "r", "o")          -- Stop newline continution of comments
vim.opt.clipboard=""                                 -- Disable clipboard
vim.opt.completeopt= {'menu', 'menuone', 'noselect'} -- nvim-cmp

-- color scheme & syntax highlighting
vim.opt.termguicolors = true
vim.cmd [[
  syntax enable
  colorscheme onedark
]]

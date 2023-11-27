local present, oil = pcall(require, "oil")

if not present then
	return
end

local opts = {
	-- disable netrw hijack to ensure GBrowse continues to work
	default_file_explorer = false,
	view_options = {
		show_hidden = true,
	},
}

oil.setup(opts)

-- automatically update oil on dir DirChanged, ref: https://github.com/stevearc/oil.nvim/issues/160
vim.cmd([[ autocmd DirChanged * lua vim.schedule_wrap(require('oil').open)(vim.v.event.cwd) ]])

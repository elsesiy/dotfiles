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

---- keymaps -----
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files({
		cwd = require("oil").get_current_dir(),
	})
end, {
	buffer = vim.bufnr,
})

vim.keymap.set("n", "<C-q>", function()
	if vim.bo.filetype ~= "oil" then
		return
	end
	local dir = oil.get_current_dir()

	local entries = {}
	for i = 1, vim.fn.line("$") do
		local entry = oil.get_entry_on_line(0, i)
		if entry and entry.type == "file" then
			table.insert(entries, {
				filename = dir .. entry.name,
			})
		end
	end
	if #entries == 0 then
		return
	end

	vim.fn.setqflist(entries)
	return vim.cmd.copen()
end)

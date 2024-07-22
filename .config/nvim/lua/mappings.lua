require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

----- normal mode -----
map("n", "<C-d>", "<C-d>zz", {
	desc = "center down",
})
map("n", "<C-u>", "<C-u>zz", {
	desc = "center up",
})
map("n", "n", "nzzzv", {
	desc = "center forward search",
})
map("n", "N", "Nzzzv", {
	desc = "center backward search",
})
map("n", "<Leader>Y", '"+Y', {
	noremap = true,
})
map("n", "<Leader>y", '"+y')
map("n", "<Leader>d", '"_d')
map("n", "<leader>sx", "yy2o<ESC>kpV:!/bin/bash<CR>", { desc = "execute command in shell and print output to buffer" })
map("n", "`", ":cd %:h<CR>", { desc = "set cwd to folder for open file" })

----- visual mode -----
map("v", "<Leader>y", '"+y')
map("v", "<Leader>d", '"_d')
map("v", "<C-j>", ":m '>+1<CR>gv=gv", {
	desc = "Move visual selection down",
})
map("v", "<C-k>", ":m '<-2<CR>gv=gv", {
	desc = "Move visual selection up",
})
map(
	"v",
	"<leader>sx",
	"y'<P'<O<ESC>'>o<ESC>:<C-u>'<,'>!/bin/bash<CR>",
	{ desc = "execute command in shell and print output to buffer" }
)

----- command mode -----
map("x", "<Leader>p", '"_dP')

----- disabled ------
local disabled = {
	n = {
		"<leader>e",
		"<leader>fa",
		"<leader>fo",
		"<leader>ma",
		"<leader>n",
		"<leader>pt",
		"<leader>rn",
		"<leader>th",
		"<leader>h",
		"<leader>v",
	},
}

for mode, mappings in pairs(disabled) do
	for _, keys in pairs(mappings) do
		nomap(mode, keys)
	end
end

----- autocommands -----
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"checkhealth",
		"fugitive*",
		"git",
		"help",
		"lspinfo",
		"netrw",
		"notify",
		"qf",
		"query",
		"spectre_panel",
	},
	callback = function()
		vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close the current buffer", buffer = true })
	end,
})

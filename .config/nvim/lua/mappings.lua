require("nvchad.mappings")

local map = vim.keymap.set
local nomap = vim.keymap.del

----- disabled nvchad mappings ------
local disabled = {
	n = {
		"<A-h>",
		"<A-i>",
		"<A-v>",
		"<C-n>",
		"<C-s>",
		"<C-c>",
		"<S-tab>",
		"<leader>ds",
		"<leader>e",
		"<leader>fa",
		"<leader>fo",
		"<leader>h",
		"<leader>ma",
		"<leader>n",
		"<leader>pt",
		"<leader>rn",
		"<leader>th",
		"<leader>v",
		"<leader>x",
		"<tab>",
	},
	t = {
		"<A-h>",
		"<A-i>",
		"<A-v>",
		"<C-x>",
	},
}

for mode, mappings in pairs(disabled) do
	for _, keys in pairs(mappings) do
		nomap(mode, keys)
	end
end

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
map("n", "<tab>", ":bn<CR>", { desc = "Show next buffer", noremap = true })
map("n", "<S-tab>", ":bp<CR>", { desc = "Show previous buffer", noremap = true })
-- https://github.com/williamboman/mason.nvim/discussions/1795
map("n", "<Leader>MIA", ":lua require('nvchad.mason').install_all()<CR>", { desc = "Install all mason packages" })

-- custom fugitive mappings
map("n", "<leader>ga", ":G add --all<CR>", { desc = "Git add all" })
map("n", "<leader>gr", ":G reset HEAD~1<CR>", { desc = "Soft reset by one commit" })
map("n", "<leader>gR", ":G reset HEAD~", { desc = "Soft reset by n commits" })
map("n", "<leader>gb", ":G blame<CR>", { desc = "Git blame" })
map("n", "<leader>gp", ":G push<CR>", { desc = "Git push" })
map("n", "<leader>gP", ":G push -f<CR>", { desc = "Git push (force)" })
map("n", "<leader>gi", ":G rebase -i", { desc = "Interactive rebase" })

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

----- autocommands -----
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"checkhealth",
		"fugitive*",
		"git",
		"help",
		"lspinfo",
		"neotest-output-panel",
		"neotest-summary",
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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.schedule(function()
			map({ "n", "v" }, "<leader>ca", function()
				require("tiny-code-action").code_action()
			end, { noremap = true, silent = true, buffer = args.buf })
		end)
	end,
})

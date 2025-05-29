-- removed stock mappings from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
	require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
	require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

----- normal mode -----
map("n", "<C-d>", "<C-d>zz", { desc = "center down" })
map("n", "<C-u>", "<C-u>zz", { desc = "center up" })
map("n", "n", "nzzzv", { desc = "center forward search" })
map("n", "N", "Nzzzv", { desc = "center backward search" })
map("n", "<Leader>Y", '"+Y', { noremap = true })
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
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up" })
map(
	"v",
	"<leader>sx",
	"y'<P'<O<ESC>'>o<ESC>:<C-u>'<,'>!/bin/bash<CR>",
	{ desc = "execute command in shell and print output to buffer" }
)

----- visual mode -----
map("i", "jk", "<Esc>", { desc = "quick esc", silent = true })

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

local lint_g = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_g,
	callback = function()
		require("lint").try_lint()
	end,
})

-- override conflicting nvchad lsp mappings from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L5
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.schedule(function()
			-- nvim 0.11 defaults: https://neovim.io/doc/user/lsp.html#_global-defaults
			pcall(vim.keymap.del, "n", "gD", { buffer = args.buf })
			pcall(vim.keymap.del, "n", "gd", { buffer = args.buf })
			pcall(vim.keymap.del, "n", "D", { buffer = args.buf })
			pcall(vim.keymap.del, "n", "<leader>ra", { buffer = args.buf })

			-- TODO: doesn't support snacks yet
			-- map({ "n", "v" }, "<leader>ca", function()
			-- 	require("tiny-code-action").code_action()
			-- end, { noremap = true, silent = true, buffer = args.buf })
		end)
	end,
})

local options = require("nvchad.configs.cmp")

options.enabled = function()
	-- disable completion for prompts such as telescope
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end

	-- keep command mode completion enabled when cursor is in a comment
	if vim.api.nvim_get_mode().mode == "c" then
		return true
	end

	-- disable completion in comments
	local context = require("cmp.config.context")
	return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
end

vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
options.experimental = {
	ghost_text = {
		hl_group = "CmpGhostText",
	},
}

options.completion = {
	completeopt = "menu,menuone,noinsert,noselect",
}

options.window = {
	completion = {
		border = {
			{ "󱐋", "WarningMsg" },
			{ "─", "Comment" },
			{ "╮", "Comment" },
			{ "│", "Comment" },
			{ "╯", "Comment" },
			{ "─", "Comment" },
			{ "╰", "Comment" },
			{ "│", "Comment" },
		},
		scrollbar = false,
		winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
	},
	documentation = {
		border = {
			{ "󰙎", "DiagnosticHint" },
			{ "─", "Comment" },
			{ "╮", "Comment" },
			{ "│", "Comment" },
			{ "╯", "Comment" },
			{ "─", "Comment" },
			{ "╰", "Comment" },
			{ "│", "Comment" },
		},
		scrollbar = false,
		winhighlight = "Normal:CmpDoc",
	},
}

-- add copilot to completion source
table.insert(options.sources, 1, { name = "copilot" })

return options

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

-- add copilot to completion source
table.insert(options.sources, 1, { name = "copilot" })

return options

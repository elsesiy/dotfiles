return {
	"olimorris/codecompanion.nvim",
	opts = {
		adapters = {
			copilot = function()
				return require("codecompanion.adapters").extend("copilot", {
					schema = {
						model = {
							default = "claude-3.5-sonnet",
						},
					},
				})
			end,
		},
		strategies = {
			agent = { adapter = "copilot" },
			chat = { adapter = "copilot" },
			inline = { adapter = "copilot" },
		},
	},
}

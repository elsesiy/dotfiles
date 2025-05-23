return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"giuxtaposition/blink-cmp-copilot",
		},
		event = "InsertEnter",
		opts = {
			appearance = {
				-- Limitation of blink not exposing default icons, ref: https://github.com/giuxtaposition/blink-cmp-copilot
				kind_icons = {
					Copilot = "",
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",

					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",

					Class = "󱡠",
					Interface = "󱡠",
					Struct = "󱡠",
					Module = "󰅩",

					Unit = "󰪚",
					Value = "󰦨",
					Enum = "󰦨",
					EnumMember = "󰦨",

					Keyword = "󰻾",
					Constant = "󰏿",

					Snippet = "󱄽",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "󰉋",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
				},
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true,
			},

			completion = {
				accept = {
					-- experimental auto-brackets support
					auto_brackets = {
						enabled = true,
					},
				},
				-- TODO: dynamic?
				-- ghost_text = { enabled = true },

				menu = {
					draw = { treesitter = { "lsp" } },
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },

			keymap = {
				preset = "default",
			},

			signature = {
				enabled = true,
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
						transform_items = function(_, items)
							local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
							local kind_idx = #CompletionItemKind + 1
							CompletionItemKind[kind_idx] = "Copilot"
							for _, item in ipairs(items) do
								item.kind = kind_idx
							end
							return items
						end,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
		version = "*",
	},

	-- catppuccin support
	{
		"catppuccin",
		optional = true,
		opts = {
			integrations = { blink_cmp = true },
		},
	},
}

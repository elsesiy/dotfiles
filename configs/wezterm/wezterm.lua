local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.default_prog = { "zellij" }
config.enable_tab_bar = false
config.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono", scale = 1.5 },
	{ family = "FiraCode", scale = 1.5 },
})
config.font_size = 13

config.disable_default_key_bindings = true
config.disable_default_mouse_bindings = true

local act = wezterm.action
config.keys = {
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = ".", mods = "SUPER", action = act.ActivateCommandPalette },
	{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
	{ key = "Enter", mods = "SUPER", action = act.ToggleFullScreen },
	{ key = ":", mods = "SUPER", action = act.ShowDebugOverlay },
	{ key = "0", mods = "SUPER", action = act.ResetFontSize },
}

return config

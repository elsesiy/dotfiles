-- Rex keymap modelled on ~/.config/zellij/config.kdl: Alt-based, with Alt+p/t/n/m/o modes.
-- Rex's own cmd-based defaults stay active. These keys are added on top.

local dirs = {
  h = "left", j = "down", k = "up", l = "right",
  left = "left", down = "down", up = "up", right = "right",
}

local function enter(key, name)
  rex.bind(key, "client.mode.enter", { name = name })
end

---------------------------------------------------------------------------
-- Custom actions
---------------------------------------------------------------------------

-- Mode keys that act and then leave the mode (zellij: action + SwitchToMode "normal").
-- A Rex mode binding runs one action, so this wraps a client action and queues the exit.
rex.action{
  name = "then_exit",
  title = "Run Action, Then Leave Mode",
  args = { action = "string", args = "object?" },
  run = function(_, a)
    rex.client.queue(a.action, a.args or {})
    rex.client.queue("client.mode.exit")
  end,
}

local function once(key, action, args)
  rex.bind(key, "then_exit", { action = action, args = args })
end

local function active_window(ctx)
  local view, err = rex.session.view{ session_id = ctx.session_id }
  if not view then return nil, err end
  for _, w in ipairs(view.windows) do
    if w.window_id == view.active_window_id then return w end
  end
end

-- zellij ToggleFloatingPanes: hide the floating panes, show them again, or open one if none exist.
rex.action{
  name = "toggle_floating",
  title = "Toggle Floating Panes",
  run = function(ctx)
    local w, err = active_window(ctx)
    if not w then return nil, err end

    local has_floating = false
    for _, layer in ipairs(w.layers) do
      if layer.kind == "floating" then has_floating = true end
    end

    -- pane.minimize_all_floating already toggles hide/show (tested), but is unavailable with no floating panes.
    rex.client.queue(has_floating and "pane.minimize_all_floating" or "pane.new_floating")
  end,
}

-- zellij EditScrollback: open the focused pane's scrollback in $VISUAL/$EDITOR in a floating pane.
-- shortcut: assumes a vi-family editor ("+" jumps to the last line), drop the "+" for other editors.
rex.action{
  name = "edit_scrollback",
  title = "Edit Scrollback",
  run = function(ctx)
    local w, err = active_window(ctx)
    if not w then return nil, err end
    local script = string.format(
      'f=$(mktemp "${TMPDIR:-/tmp}/rex-scrollback.XXXXXX") && "${REX_BIN_DIR:+$REX_BIN_DIR/}rex" capture -b %s --trim --unwrap > "$f" && "${VISUAL:-${EDITOR:-vi}}" + "$f"; rm -f "$f"',
      w.focused_block_id)
    rex.session.new_layer{
      session_id = ctx.session_id,
      window_id = w.window_id,
      bounds = { 0.05, 0.05, 0.9, 0.9 },
      focus = true,
      layout = rex.layout.block{
        flavor = "com.superlogical.terminal.shell",
        options = { command = { "sh", "-c", script } },
      },
    }
  end,
}

---------------------------------------------------------------------------
-- Direct keys (zellij: shared_except "locked")
---------------------------------------------------------------------------

-- Ghostty parity: cmd+enter toggles full screen (Rex default is a best-fit split).
rex.bind("cmd+enter", "client.window.fullscreen.toggle")
rex.bind("cmd+k", "com.superlogical.terminal.clear") -- Rex default: session switcher; clears screen and scrollback
rex.bind("cmd+shift+g", "client.find.previous") -- Rex default clashes with go_to_directory (on alt+space)
rex.bind("cmd+shift+r", "client.config.reload")
rex.bind("cmd+[Backslash]", "client.visibility.toggle") -- Ghostty quick terminal key

-- alt+left/right stay unbound so fish word movement keeps working.
rex.bind("alt+h", "pane.focus", { direction = "left", wrap = false })
rex.bind("alt+l", "pane.focus", { direction = "right", wrap = false })
rex.bind("alt+j", "pane.focus", { direction = "down", wrap = false })
rex.bind("alt+k", "pane.focus", { direction = "up", wrap = false })
for i = 1, 9 do
  rex.bind("alt+[Digit" .. i .. "]", "client.tab.goto", { index = i })
end
rex.bind("alt+[Digit0]", "client.tab.goto", { index = 10 })
rex.bind("alt+d", "pane.split", { direction = "down" })
rex.bind("alt+r", "pane.split", { direction = "right" })
rex.bind("alt+shift+n", "pane.split.auto")
rex.bind("alt+f", "toggle_floating")
rex.bind("alt+w", "toggle_floating")
rex.bind("alt+i", "client.tab.move.backward")
rex.bind("alt+[", "client.tab.previous") -- zellij: previous swap layout, no Rex equivalent
rex.bind("alt+]", "client.tab.next")
rex.bind("alt+space", "pane.go_to_directory") -- zellij: sessionizer
rex.bind("alt+s", "pane.copy_mode.enter") -- zellij: scroll mode
rex.bind("alt+e", "edit_scrollback") -- zellij: scroll mode, e

-- Modes stay open until Escape, the mode key again, or a key that acts and leaves.
-- Exclusive, like zellij, so stray keys never reach the shell.
for _, m in ipairs({ "pane", "tab", "session", "resize", "move" }) do
  rex.mode(m, { exclusive = true })
end
enter("alt+p", "pane")
enter("alt+t", "tab")
enter("alt+o", "session")
enter("alt+n", "resize")
enter("alt+m", "move")

---------------------------------------------------------------------------
-- pane mode
---------------------------------------------------------------------------
once("pane/c", "pane.rename")
once("pane/e", "pane.float")
once("pane/f", "pane.zoom")
once("pane/x", "pane.close")
rex.bind("pane/alt+p", "client.mode.exit")

---------------------------------------------------------------------------
-- tab mode
---------------------------------------------------------------------------
for _, key in ipairs({ "h", "k", "left", "up" }) do rex.bind("tab/" .. key, "client.tab.previous") end
for _, key in ipairs({ "j", "l", "right", "down" }) do rex.bind("tab/" .. key, "client.tab.next") end
for i = 1, 9 do once("tab/" .. i, "client.tab.goto", { index = i }) end
once("tab/n", "client.tab.new")
once("tab/x", "client.tab.close")
once("tab/r", "client.tab.rename")
once("tab/b", "pane.move_to_new_tab")
rex.bind("tab/alt+t", "client.mode.exit")

---------------------------------------------------------------------------
-- resize mode: shift = bigger step. Zellij's shift+hjkl shrinks instead.
---------------------------------------------------------------------------
for key, dir in pairs(dirs) do
  rex.bind("resize/" .. key, "pane.resize", { direction = dir })
  if #key == 1 then
    rex.bind("resize/shift+" .. key, "pane.resize", { direction = dir, amount = 15 })
  end
end
rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")
rex.bind("resize/alt+n", "client.mode.exit")

---------------------------------------------------------------------------
-- move mode
---------------------------------------------------------------------------
for key, dir in pairs(dirs) do
  rex.bind("move/" .. key, "pane.move", { direction = dir })
end
rex.bind("move/enter", "client.mode.exit")
rex.bind("move/alt+m", "client.mode.exit")

---------------------------------------------------------------------------
-- session mode
---------------------------------------------------------------------------
once("session/w", "session.switch")
once("session/f", "client.window.fullscreen.toggle")
rex.bind("session/alt+o", "client.mode.exit")

---------------------------------------------------------------------------
-- Appearance. init.lua cannot set these at load, so run `rex do apply_appearance` once per machine.
---------------------------------------------------------------------------
local config_dir = (os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")) .. "/rex"

rex.action{
  name = "apply_appearance",
  title = "Apply Appearance",
  description = "Import the Catppuccin Mocha theme, set the terminal font, size, cursor and toolbar, and install Rex for agents.",
  run = function()
    rex.client.queue("client.setting.interface.toolbar.layout", { value = "left" })
    rex.client.queue("client.agents.setup") -- installs the Rex skill and hooks for Claude Code, Codex and others
    rex.client.queue("client.theme.import", { path = config_dir .. "/themes/catppuccin-mocha" })
    rex.client.queue("client.setting.terminal.typography.font", { value = "JetBrainsMono Nerd Font Mono" })
    rex.client.queue("client.setting.terminal.typography.size", { value = 16 })
    rex.client.queue("client.setting.terminal.cursor.style", { value = "block" })
    rex.client.queue("client.setting.terminal.cursor.blink", { value = "off" })
    rex.client.queue("client.setting.terminal.selection.copy_on_select", { value = true }) -- zellij default
  end,
}

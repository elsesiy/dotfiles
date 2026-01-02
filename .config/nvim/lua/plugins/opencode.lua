local env = require("env")

return {
  "sudo-tee/opencode.nvim",
  config = function()
    require("opencode").setup({
      default_global_keymaps = false,
      default_mode = "plan",
      keymap = {
        editor = {
          ["<leader>o["] = { "diff_prev" }, -- Navigate to previous file diff
          ["<leader>o]"] = { "diff_next" }, -- Navigate to next file diff
          ["<leader>oc"] = { "diff_close" }, -- Close diff view tab and return to normal editing
          ["<leader>od"] = { "diff_open" }, -- Opens a diff tab of a modified file since the last opencode prompt
          ["<leader>oI"] = { "open_input_new_session" }, -- Opens and focuses on input window on insert mode. Creates a new session
          ["<leader>oi"] = { "open_input" }, -- Opens and focuses on input window on insert mode
          ["<leader>oo"] = { "open_output" }, -- Opens and focuses on output window
          ["<leader>op"] = { "configure_provider" }, -- Quick provider and model switch from predefined list
          ["<leader>opA"] = { "permission_accept_all" }, -- Accept all (for current tool)
          ["<leader>opa"] = { "permission_accept" }, -- Accept permission request once
          ["<leader>opd"] = { "permission_deny" }, -- Deny permission request once
          ["<leader>oq"] = { "close" }, -- Close UI windows
          ["<leader>oR"] = { "rename_session" }, -- Rename current session
          ["<leader>ora"] = { "diff_revert_all_last_prompt" }, -- Revert all file changes since the last opencode prompt
          ["<leader>orA"] = { "diff_revert_all" }, -- Revert all file changes since the last opencode session
          ["<leader>orR"] = { "diff_restore_snapshot_all" }, -- Restore all files to a restore point
          ["<leader>orr"] = { "diff_restore_snapshot_file" }, -- Restore a file to a restore point
          ["<leader>ort"] = { "diff_revert_this_last_prompt" }, -- Revert current file changes since the last opencode prompt
          ["<leader>orT"] = { "diff_revert_this" }, -- Revert current file changes since the last opencode session
          ["<leader>os"] = { "select_session" }, -- Select and load a opencode session
          ["<leader>oT"] = { "timeline" }, -- Display timeline picker to navigate/undo/redo/fork messages
          ["<leader>ot"] = { "toggle" }, -- Open opencode. Close if opened
          ["<leader>oX"] = { "swap_position" }, -- Swap Opencode pane left/right
          ["<leader>oz"] = { "toggle_zoom" }, -- Zoom in/out on the Opencode windows
        },
        input_window = {
          ["@"] = { "mention", mode = "i" }, -- Insert mention (file/agent)
          ["/"] = { "slash_commands", mode = "i" }, -- Pick a command to run in the input window
          ["<C-c>"] = { "cancel" }, -- Cancel opencode request while it is running
          ["<cr>"] = { "submit_input_prompt", mode = { "n", "i" } }, -- Submit prompt (normal mode and insert mode)
          ["<down>"] = { "next_prompt_history", mode = { "n", "i" } }, -- Navigate to next prompt in history
          ["<M-m>"] = { "switch_mode" }, -- Switch between modes (build/plan)
          ["<tab>"] = { "toggle_pane", mode = { "n", "i" } }, -- Toggle between input and output panes
          ["<up>"] = { "prev_prompt_history", mode = { "n", "i" } }, -- Navigate to previous prompt in history
          ["~"] = { "mention_file", mode = "i" }, -- Pick a file and add to context. See File Mentions section
          ["q"] = { "close" }, -- Close UI windows
        },
        output_window = {
          ["[["] = { "prev_message" }, -- Navigate to previous message in the conversation
          ["]]"] = { "next_message" }, -- Navigate to next message in the conversation
          ["<C-c>"] = { "cancel" }, -- Cancel opencode request while it is running
          ["<C-i>"] = { "focus_input" }, -- Focus on input window and enter insert mode at the end of the input from the output window
          ["<leader>oD"] = { "debug_message" }, -- Open raw message in new buffer for debugging
          ["<leader>ods"] = { "debug_session" }, -- Open raw session in new buffer for debugging
          ["<leader>oO"] = { "debug_output" }, -- Open raw output in new buffer for debugging
          ["<leader>oS"] = { "select_child_session" }, -- Select and load a child session
          ["<tab>"] = { "toggle_pane", mode = { "n", "i" } }, -- Toggle between input and output panes
          ["q"] = { "close" }, -- Close UI windows
        },
        permission = {
          accept = "a", -- Accept permission request once (only available when there is a pending permission request)
          accept_all = "A", -- Accept all (for current tool) permission request once (only available when there is a pending permission request)
          deny = "d", -- Deny permission request once (only available when there is a pending permission request)
        },
        session_picker = {
          delete_session = { "<C-d>" }, -- Delete selected session in the session picker
          new_session = { "<C-n>" }, -- Create and switch to a new session in the session picker
          rename_session = { "<C-r>" }, -- Rename selected session in the session picker
        },
        timeline_picker = {
          fork = { "<C-f>", mode = { "i", "n" } }, -- Fork from selected message in timeline picker
          undo = { "<C-u>", mode = { "i", "n" } }, -- Undo to selected message in timeline picker
        },
      },
      ui = {
        completion = {
          file_sources = {
            preferred_cli_tool = "fd", -- 'fd','fdfind','rg','git','server' if nil, it will use the best available tool, 'server' uses opencode cli to get file list (works cross platform) and supports folders
            ignore_patterns = {
              -- default
              "^%.git/",
              "^%.svn/",
              "^%.hg/",
              "node_modules/",
              "%.pyc$",
              "%.o$",
              "%.obj$",
              "%.exe$",
              "%.dll$",
              "%.so$",
              "%.dylib$",
              "%.class$",
              "%.jar$",
              "%.war$",
              "%.ear$",
              "target/",
              "build/",
              "dist/",
              "out/",
              "deps/",
              "%.tmp$",
              "%.temp$",
              "%.log$",
              "%.cache$",

              -- custom
              "bazel-*/",
              "bazel-bin/",
              "bazel-out/",
              "bazel-testlogs/",
              "vendor/",
            },
          },
        },
        input = {
          text = {
            wrap = true,
          },
        },
      },
      preferred_completion = "blink",
      preferred_picker = "snacks",
    })
  end,
  enabled = function() return not env.is_cws() end,
  event = "VeryLazy",
}

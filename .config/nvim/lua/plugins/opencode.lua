return {
  "sudo-tee/opencode.nvim",
  config = function()
    require("opencode").setup({
      default_global_keymaps = false,
      keymap = {
        editor = {
          ["<leader>ot"] = { "toggle" }, -- Open opencode. Close if opened
          ["<leader>oi"] = { "open_input" }, -- Opens and focuses on input window on insert mode
          ["<leader>oI"] = { "open_input_new_session" }, -- Opens and focuses on input window on insert mode. Creates a new session
          ["<leader>oo"] = { "open_output" }, -- Opens and focuses on output window
          ["<leader>oq"] = { "close" }, -- Close UI windows
          ["<leader>os"] = { "select_session" }, -- Select and load a opencode session
          ["<leader>op"] = { "configure_provider" }, -- Quick provider and model switch from predefined list
          ["<leader>od"] = { "diff_open" }, -- Opens a diff tab of a modified file since the last opencode prompt
          ["<leader>o]"] = { "diff_next" }, -- Navigate to next file diff
          ["<leader>o["] = { "diff_prev" }, -- Navigate to previous file diff
          ["<leader>oc"] = { "diff_close" }, -- Close diff view tab and return to normal editing
          ["<leader>ora"] = { "diff_revert_all_last_prompt" }, -- Revert all file changes since the last opencode prompt
          ["<leader>ort"] = { "diff_revert_this_last_prompt" }, -- Revert current file changes since the last opencode prompt
          ["<leader>orA"] = { "diff_revert_all" }, -- Revert all file changes since the last opencode session
          ["<leader>orT"] = { "diff_revert_this" }, -- Revert current file changes since the last opencode session
          ["<leader>orr"] = { "diff_restore_snapshot_file" }, -- Restore a file to a restore point
          ["<leader>orR"] = { "diff_restore_snapshot_all" }, -- Restore all files to a restore point
          ["<leader>oX"] = { "swap_position" }, -- Swap Opencode pane left/right
          ["<leader>opa"] = { "permission_accept" }, -- Accept permission request once
          ["<leader>opA"] = { "permission_accept_all" }, -- Accept all (for current tool)
          ["<leader>opd"] = { "permission_deny" }, -- Deny permission request once
        },
        input_window = {
          ["<cr>"] = { "submit_input_prompt", mode = { "n", "i" } }, -- Submit prompt (normal mode and insert mode)
          ["q"] = { "close" }, -- Close UI windows
          ["<C-c>"] = { "stop" }, -- Stop opencode while it is running
          ["~"] = { "mention_file", mode = "i" }, -- Pick a file and add to context. See File Mentions section
          ["@"] = { "mention", mode = "i" }, -- Insert mention (file/agent)
          ["/"] = { "slash_commands", mode = "i" }, -- Pick a command to run in the input window
          ["<tab>"] = { "toggle_pane", mode = { "n", "i" } }, -- Toggle between input and output panes
          ["<up>"] = { "prev_prompt_history", mode = { "n", "i" } }, -- Navigate to previous prompt in history
          ["<down>"] = { "next_prompt_history", mode = { "n", "i" } }, -- Navigate to next prompt in history
          ["<M-m>"] = { "switch_mode" }, -- Switch between modes (build/plan)
        },
        output_window = {
          ["q"] = { "close" }, -- Close UI windows
          ["<C-c>"] = { "stop" }, -- Stop opencode while it is running
          ["]]"] = { "next_message" }, -- Navigate to next message in the conversation
          ["[["] = { "prev_message" }, -- Navigate to previous message in the conversation
          ["<tab>"] = { "toggle_pane", mode = { "n", "i" } }, -- Toggle between input and output panes
          ["<C-i>"] = { "focus_input" }, -- Focus on input window and enter insert mode at the end of the input from the output window
          ["<leader>oS"] = { "select_child_session" }, -- Select and load a child session
          ["<leader>oD"] = { "debug_message" }, -- Open raw message in new buffer for debugging
          ["<leader>oO"] = { "debug_output" }, -- Open raw output in new buffer for debugging
          ["<leader>ods"] = { "debug_session" }, -- Open raw session in new buffer for debugging
        },
        permission = {
          accept = "a", -- Accept permission request once (only available when there is a pending permission request)
          accept_all = "A", -- Accept all (for current tool) permission request once (only available when there is a pending permission request)
          deny = "d", -- Deny permission request once (only available when there is a pending permission request)
        },
      },
      ui = {
        input = {
          text = {
            wrap = true,
          },
        },
      },
    })
  end,
  event = "VeryLazy",
}

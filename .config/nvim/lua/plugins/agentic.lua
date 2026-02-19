local env = require("env")

return {
  {
    "carlos-algms/agentic.nvim",

    opts = {
      provider = env.ai_acp_tool(),
      acp_providers = env.is_cws()
          and {
            ["claude-acp"] = {
              -- Unset base creds so GetCallerIdentity fails and the CLI
              -- uses awsCredentialExport from ~/.claude/settings.json
              env = {
                AWS_ACCESS_KEY_ID = "",
                AWS_SECRET_ACCESS_KEY = "",
                AWS_SESSION_TOKEN = "",
              },
            },
          }
        or nil,
    },

    keys = {
      {
        "<C-\\>",
        function() require("agentic").toggle() end,
        mode = { "n", "v", "i" },
        desc = "Toggle Agentic Chat",
      },
      {
        "<C-'>",
        function() require("agentic").add_selection_or_file_to_context() end,
        mode = { "n", "v" },
        desc = "Add file or selection to Agentic to Context",
      },
      {
        "<C-,>",
        function() require("agentic").new_session() end,
        mode = { "n", "v", "i" },
        desc = "New Agentic Session",
      },
      {
        "<C-;>",
        function() require("agentic").restore_session() end,
        desc = "Agentic Restore session",
        silent = true,
        mode = { "n", "v", "i" },
      },
    },
  },
}

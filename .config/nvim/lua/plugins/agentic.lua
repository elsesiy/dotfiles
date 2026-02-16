local env = require("env")

return {
  {
    "carlos-algms/agentic.nvim",

    opts = {
      provider = env.ai_acp_tool(),
      acp_providers = env.is_cws()
          and {
            ["claude-acp"] = {
              -- Temporary until https://github.com/carlos-algms/agentic.nvim/issues/120 is addressed
              --
              -- The transport only forwards a small set of essential env vars
              -- (HOME, PATH, etc). We need to forward additional vars for Bedrock
              -- auth and Nix TLS, and unset base AWS creds so the CLI falls back
              -- to awsCredentialExport for Bedrock auth with auto-refresh.
              env = (function()
                local e = {}
                local forward = {
                  "ANTHROPIC_",
                  "CLAUDE_CODE_", -- model + config
                  "AWS_ROLE_ARN",
                  "AWS_WEB_IDENTITY_TOKEN_FILE", -- credential helper bootstrap
                  "AWS_REGION",
                  "AWS_DEFAULT_REGION",
                  "AWS_STS_REGIONAL_ENDPOINTS",
                  "NIX_SSL_CERT_FILE", -- Nix Node.js TLS
                }
                for k, v in pairs(vim.fn.environ()) do
                  for _, pat in ipairs(forward) do
                    if k == pat or k:sub(1, #pat) == pat then
                      e[k] = v
                      break
                    end
                  end
                end
                -- Unset base creds so GetCallerIdentity fails and the CLI
                -- uses awsCredentialExport from ~/.claude/settings.json
                e.AWS_ACCESS_KEY_ID = ""
                e.AWS_SECRET_ACCESS_KEY = ""
                e.AWS_SESSION_TOKEN = ""
                return e
              end)(),
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

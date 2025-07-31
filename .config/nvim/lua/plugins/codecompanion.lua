local default_model = function()
  if vim.env.USER == "jelsesiy" then
    return "gemini-2.5-pro"
  else
    return "claude-3.5-sonnet"
  end
end

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    -- "ravitemer/codecompanion-history.nvim",
    -- {
    -- 	"Davidyz/VectorCode", -- Index and search code in your repositories
    -- 	version = "*",
    -- 	build = "pipx upgrade vectorcode",
    -- 	dependencies = { "nvim-lua/plenary.nvim" },
    -- },
  },
  keys = {
    {
      "<leader>cc",
      mode = { "n", "v" },
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "Toggle LLM Chat (CodeCompanion)",
    },
    -- {
    -- 	"<localleader>ca",
    -- 	mode = { "v" },
    -- 	"<cmd>CodeCompanionChat Add<CR>",
    -- 	desc = "Add code to chat buffer",
    -- },
    {
      "<leader>cp",
      mode = { "n", "v" },
      "<cmd>CodeCompanionActions<CR>",
      desc = "Open the action palette",
    },
  },
  opts = {
    extensions = {
      -- history = {
      -- 	enabled = true,
      -- 	opts = {
      -- 		keymap = "gh",
      -- 		auto_generate_title = true,
      -- 		continue_last_chat = false,
      -- 		delete_on_clearing_chat = false,
      -- 		picker = "snacks",
      -- 		enable_logging = false,
      -- 		dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
      -- 	},
      -- },
      -- vectorcode = {
      -- 	opts = {
      -- 		add_tool = true,
      -- 	},
      -- },
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = default_model(),
            },
          },
        })
      end,
    },
    strategies = {
      agent = { adapter = "copilot" },
      chat = {
        adapter = "copilot",
        roles = {
          user = "Jonas",
        },
        keymaps = {
          close = {
            modes = {
              n = "q",
            },
          },
        },
        tools = {
          opts = {
            auto_submit_success = false,
            auto_submit_errors = false,
          },
        },
      },
      inline = { adapter = "copilot" },
    },
    opts = {},
  },
}

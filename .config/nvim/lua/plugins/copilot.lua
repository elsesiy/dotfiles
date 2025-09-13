local env = require("env")

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup({
        copilot_model = env.ai_model(),
        suggestion = { enabled = false },
        panel = { enabled = false },
        server_opts_overrides = {
          settings = {
            telemetry = {
              telemetryLevel = "off",
            },
          },
        },
      })
    end,
  },
}

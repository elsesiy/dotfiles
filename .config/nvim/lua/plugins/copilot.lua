local default_model = function()
  if vim.env.USER == "jelsesiy" then
    return "claude-sonnet-4"
  else
    return "claude-3.5-sonnet"
  end
end

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    config = function()
      require("copilot").setup({
        copilot_model = default_model(),
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

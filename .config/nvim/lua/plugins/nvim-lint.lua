local env = require("env")

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>fl", function() require("lint").try_lint() end, desc = "Lint file" },
  },
  config = function() require("lint").linters_by_ft = env.linters() end




}

return {
  {
    "mrcjkb/rustaceanvim",
    config = function(_, opts) vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {}) end,
    lazy = false,
    opts = function() return require("configs.rustaceanvim") end,
    version = "^6",
  },
}

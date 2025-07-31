return {
  {
    "daliusd/ghlite.nvim",
    config = function()
      require("ghlite").setup({})
    end,
    keys = {
      { "<leader>us", ":GHLitePRSelect<cr>", silent = true },
      { "<leader>uo", ":GHLitePRCheckout<cr>", silent = true },
      { "<leader>uv", ":GHLitePRView<cr>", silent = true },
      { "<leader>uu", ":GHLitePRLoadComments<cr>", silent = true },
      { "<leader>up", ":GHLitePRDiff<cr>", silent = true },
      { "<leader>ul", ":GHLitePRDiffview<cr>", silent = true },
      { "<leader>ua", ":GHLitePRAddComment<cr>", silent = true },
      { "<leader>uc", ":GHLitePRUpdateComment<cr>", silent = true },
      { "<leader>ud", ":GHLitePRDeleteComment<cr>", silent = true },
      { "<leader>ug", ":GHLitePROpenComment<cr>", silent = true },
    },
  },
}

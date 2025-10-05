return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "leoluz/nvim-dap-go",
        opts = {},
      },
    },
  },

  {
    "olexsmir/gopher.nvim",
    build = function() vim.cmd([[silent! GoInstallDeps]]) end,
    ft = "go",
    keys = {
      { "<leader>gsj", "<cmd>GoTagAdd json<CR>", desc = "Add json struct tags" },
      { "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", desc = "Add yaml struct tags" },
    },
    opts = {},
  },

  -- Show interface implementations
  {
    "maxandron/goplements.nvim",
    ft = "go",
    opts = {},
  },
}

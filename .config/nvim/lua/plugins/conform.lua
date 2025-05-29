return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    { "<leader>fm", function() require("conform").format({ async = true, lsp_format = "fallback" }) end, mode = "", desc = "Format buffer" },
  },
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      go = { "gofumpt", "goimports" },
      java = { "google-java-format" },
      json = { "jq" },
      lua = { "stylua" },
      nix = { "nixfmt" },
      python = { "ruff_organize_imports", "ruff_format", "ruff_fix" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      terraform = { "terraform_fmt" },
      yaml = { "yamlfix" },
      ["_"] = { "codespell", lsp_fallback = "last" },
      ["*"] = { "trim_whitespace", "trim_newlines" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      yamlfix = {
        env = {
          YAMLFIX_SEQUENCE_STYLE = "keep_style",
        },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

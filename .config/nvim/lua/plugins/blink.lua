return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    enabled = function() return not vim.tbl_contains({ "AgenticInput" }, vim.bo.filetype) end,
    event = "InsertEnter",
    opts = {
      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        -- TODO: dynamic?
        -- ghost_text = { enabled = true },

        menu = {
          draw = { treesitter = { "lsp" } },
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },

      keymap = {
        preset = "default",
      },

      signature = {
        enabled = true,
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          markdown = { inherit_defaults = true },
          sql = { "dadbod", "snippets", "buffer" },
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
    },
    opts_extend = { "sources.default" },
    version = "*",
  },

  -- catppuccin support
  {
    "catppuccin",
    optional = true,
    opts = {
      integrations = { blink_cmp = true },
    },
  },
}

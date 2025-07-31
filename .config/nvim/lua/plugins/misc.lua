local plugins = {
  -- override misc built-in plugin configs
  {
    "mason-org/mason.nvim",
    opts = {
      PATH = "prepend",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "awk",
        "bash",
        "cmake",
        "cpp",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "editorconfig",
        "fish",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "gpg",
        "graphql",
        "groovy",
        "hcl",
        "html",
        "http",
        "java",
        "javascript",
        "jq",
        "json",
        "jsonnet",
        "kdl",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nix",
        "passwd",
        "pem",
        "promql",
        "proto",
        "python",
        "regex",
        "rust",
        "scss",
        "sql",
        "terraform",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zig",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      show_help = false,
      show_keys = false,
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      numhl = true,
      current_line_blame = true,
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        -- Actions
        map("n", "<leader>hs", gitsigns.stage_hunk)
        map("n", "<leader>hr", gitsigns.reset_hunk)

        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)

        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)

        map("n", "<leader>hS", gitsigns.stage_buffer)
        map("n", "<leader>hR", gitsigns.reset_buffer)
        map("n", "<leader>hp", gitsigns.preview_hunk)
        map("n", "<leader>hi", gitsigns.preview_hunk_inline)

        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end)

        map("n", "<leader>hd", gitsigns.diffthis)

        map("n", "<leader>hD", function()
          gitsigns.diffthis("~")
        end)

        map("n", "<leader>hQ", function()
          gitsigns.setqflist("all")
        end)
        map("n", "<leader>hq", gitsigns.setqflist)

        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
        map("n", "<leader>tw", gitsigns.toggle_word_diff)

        -- Text object
        map({ "o", "x" }, "ih", gitsigns.select_hunk)
      end,
    },
  },

  -- disable misc built-in plugins
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
  },

  -- other plugins
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- Better search motions
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
    opts = {},
    specs = {
      {
        "folke/snacks.nvim",
        opts = {
          picker = {
            win = {
              input = {
                keys = {
                  ["<a-s>"] = { "flash", mode = { "n", "i" } },
                  ["s"] = { "flash" },
                },
              },
            },
            actions = {
              flash = function(picker)
                require("flash").jump({
                  pattern = "^",
                  label = { after = { 0, 0 } },
                  search = {
                    mode = "search",
                    exclude = {
                      function(win)
                        return vim.bo[vim.api.nvim_win_get_buf(win)].filetype
                          ~= "snacks_picker_list"
                      end,
                    },
                  },
                  action = function(match)
                    local idx = picker.list:row2idx(match.pos[1])
                    picker.list:_move(idx, true, true)
                  end,
                })
              end,
            },
          },
        },
      },
    },
  },

  -- Misc
  { "ThePrimeagen/vim-be-good", event = "VeryLazy" },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      { "<Leader>ht", ":Hardtime toggle<CR>", desc = "[h]ardtime [t]oggle" },
    },
    opts = {},
  },
  { "machakann/vim-highlightedyank", event = "VeryLazy" },
  { "kevinhwang91/nvim-bqf", event = "VeryLazy" },
  ---- Detect tabstop and shiftwidth automatically, maybe replace with faster alternatives
  { "tpope/vim-sleuth", opts = {} },
  -- { "Darazaki/indent-o-matic", opts = {} },
  -- { "NMAC427/guess-indent.nvim", opts = {} },

  -- Better folds
  {
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    config = function()
      --- @diagnostic disable: unused-local
      require("ufo").setup({
        provider_selector = function(_bufnr, _filetype, _buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    keys = {
      { "zR", function() require("ufo").openAllFolds() end, "Open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, "Close all folds" },
      { "zV", function() require("ufo").peekFoldedLinesUnderCursor() end, "Peek folded lines" },
    },
  },

  -- surround text objects
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- split/join objects, arrays, etc.
  {
    "Wansmer/treesj",
    config = function()
      require("treesj").setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>j", "<cmd> TSJToggle <CR>", desc = "TreeSJ toggle" },
    },
  },

  -- fix until https://github.com/neovim/neovim/issues/12517 lands to avoid files opening in quickfix and similar buffers
  { "stevearc/stickybuf.nvim", opts = {} },

  -- highlight colors, replaces NvChad/nvim-colorizer.lua
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      exclude_buftypes = {
        "help",
        "prompt",
      },
      render = "virtual",
    },
  },

  -- markdown support
  {
    "OXY2DEV/markview.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = "markdown",
    keys = { { "<Leader>md", ":Markview<CR>", desc = "Markview toggle" } },
  },

  -- highlight words under cursor
  {
    "echasnovski/mini.cursorword",
    config = function()
      require("mini.cursorword").setup()
    end,
    version = "*",
  },

  -- more/enhanced treesitter textobjects
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup()
    end,
    version = "*",
  },

  -- show visual separator for multiple windows
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },
}

return plugins

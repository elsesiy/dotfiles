local map = vim.keymap.set

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "checkhealth",
    "fugitive*",
    "git",
    "help",
    "lspinfo",
    "neotest-output-panel",
    "neotest-summary",
    "netrw",
    "notify",
    "qf",
    "query",
    "spectre_panel",
  },
  callback = function() vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close the current buffer", buffer = true }) end,
})

local lint_g = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_g,
  callback = function() require("lint").try_lint() end,
})

-- override conflicting nvchad lsp mappings from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/lspconfig.lua#L5
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.schedule(function()
      -- nvim 0.11 defaults: https://neovim.io/doc/user/lsp.html#_global-defaults
      pcall(vim.keymap.del, "n", "gD", { buffer = args.buf })
      pcall(vim.keymap.del, "n", "gd", { buffer = args.buf })
      pcall(vim.keymap.del, "n", "D", { buffer = args.buf })
      pcall(vim.keymap.del, "n", "<leader>ra", { buffer = args.buf })

      map(
        { "n", "v" },
        "<leader>ca",
        function() require("tiny-code-action").code_action() end,
        { noremap = true, silent = true, buffer = args.buf }
      )
    end)
  end,
})

-- auto-resize splits when vim is resized
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

-- stop comment continuation on new lines
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("no_auto_comment", {}),
  callback = function() vim.opt_local.formatoptions:remove({ "c", "r", "o" }) end,
})

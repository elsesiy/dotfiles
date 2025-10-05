return {
  "sudo-tee/opencode.nvim",
  config = function()
    require("opencode").setup({
      input = {
        keymap = {
          global = {
            toggle = "<leader>ot",
            swap_position = "",
          },
        },
        text = {
          wrap = true,
        },
      },
    })
  end,
  event = "VeryLazy",
}

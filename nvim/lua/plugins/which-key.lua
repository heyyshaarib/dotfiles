return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ mode = "n" }) -- Show normal mode keymaps
      end,
      desc = "Show Buffer Local Keymaps",
    },
  },
}
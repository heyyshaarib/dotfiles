return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
      require("transparent").setup({
        groups = {
          "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
          "Statement", "PreProc", "Type", "Underlined", "Todo", "String", "Function",
          "Conditional", "Repeat", "Operator", "Structure", "LineNr", "NonText",
          "SignColumn", "CursorLine", "CursorLineNr", "StatusLine", "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {
          "NormalFloat", -- floating windows
          "NvimTreeNormal", -- NvimTree
        },
        exclude_groups = {},
        on_clear = function() end,
      })
      vim.keymap.set('n', '<leader>tt', ':TransparentToggle<CR>', { noremap = true, silent = true, desc = "Toggle Transparency" })
    end,
  },
}
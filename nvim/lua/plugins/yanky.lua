return {
  "gbprod/yanky.nvim",
  event = "BufRead",
  opts = {
    highlight = { timer = 150 }, -- Highlight yanked text briefly
  },
  keys = {
    -- Core yank/paste behavior
    { "y",  "<Plug>(YankyYank)",          mode = { "n", "x" },                 desc = "Yank" },
    { "p",  "<Plug>(YankyPutAfter)",      mode = { "n", "x" },                 desc = "Paste After" },
    { "P",  "<Plug>(YankyPutBefore)",     mode = { "n", "x" },                 desc = "Paste Before" },

    -- Yank history cycle
    { "[y", "<Plug>(YankyCycleForward)",  desc = "Cycle Forward Yank History" },
    { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Yank History" },

    -- Yank history menu (Telescope or fallback)
    {
      "<leader>p",
      function()
        local has_telescope, _ = pcall(require, "telescope")
        if has_telescope then
          require("telescope").extensions.yank_history.yank_history({})
        else
          vim.cmd("YankyRingHistory")
        end
      end,
      desc = "Open Yank History",
    },
  },
}
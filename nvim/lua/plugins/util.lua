return {
    { "tpope/vim-sleuth" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-lua/plenary.nvim", lazy = true },
    { "meznaric/key-analyzer.nvim", opts = {} },
    -- { "nvim-lua/popup.nvim", lazy = true },
    -- { "nvim-telescope/telescope.nvim", lazy = true },
    -- { "nvim-telescope/telescope-media-files.nvim", lazy = true },
    -- { "nvim-telescope/telescope-project.nvim", lazy = true },
    -- { "nvim-telescope/telescope-symbols.nvim", lazy = true },
    -- { "nvim-telescope/telescope-frecency.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzy-native.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-writer.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-sorter.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-commands.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-preview.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-quickfix.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-files.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-grep.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-lsp.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-git.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-builtin.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-extensions.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-commands.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-extensions.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-commands.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-extensions.nvim", lazy = true },
    -- { "nvim-telescope/telescope-fzf-commands.nvim", lazy = true },
    {
      "folke/twilight.nvim",
      ft = "markdown",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
        -- stylua: ignore
        keys = {
          { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
          { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
          { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
          { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
        },
    }
}
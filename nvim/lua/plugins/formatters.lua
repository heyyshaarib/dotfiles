return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format File",
      },
    },
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" }, -- use ruff as formatter
        c = { "clang_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },
      formatters = {
        ruff_format = {
          command = vim.fn.stdpath("data") .. "/mason/bin/ruff",
          args = { "format", "-" },
          stdin = true,
        },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 3000,
      },
    },
  },
}

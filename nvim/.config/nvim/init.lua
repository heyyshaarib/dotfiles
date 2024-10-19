-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.loader then
  vim.loader.enable()
end

require("config.lazy")
require("lspconfig").jsonls.setup({
  settings = {
    json = {
      -- Enable JSON schema validation
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
      },
      -- Enable/disable formatting
      format = {
        enable = true,
        -- Specify the required field `keepLines`
        keepLines = true,
      },
      -- Enable/disable color decorators (like syntax highlighting)
      colorDecorators = true,
      -- Limit for the number of computed items in the workspace
      maxItemsComputed = 1000,
      -- Enable/disable automatic schema download
      schemaDownload = {
        enable = true,
      },
    },
  },
})

-- vim.o.clipboard = vim.o.clipboard .. ",unnamedplus"
vim.g.clipboard = "xclip"
vim.cmd("set clipboard+=unnamedplus")

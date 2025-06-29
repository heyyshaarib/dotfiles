return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- Last release is too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    lazy = vim.fn.argc(-1) == 0, -- Load Tree-sitter early when opening a file from the command line
    init = function(plugin)
      -- PERF: Add nvim-treesitter queries to the runtime path and its custom query predicates early
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>",      desc = "Decrement Selection", mode = "x" },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    ---@type TSConfig
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash", "c", "diff", "html", "javascript", "jsdoc", "json", "jsonc", "lua",
        "luadoc", "luap", "markdown", "markdown_inline", "python", "query",
        "java", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "xml", "yaml",
        "gitignore", "dockerfile", "make", "cmake", "ini", "scss", "css",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = '<c-s>',
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['ii'] = '@conditional.inner',
            ['ai'] = '@conditional.outer',
            ['il'] = '@loop.inner',
            ['al'] = '@loop.outer',
            ['at'] = '@comment.outer',
          },
        },
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner"
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner"
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner"
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner"
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim"
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
}
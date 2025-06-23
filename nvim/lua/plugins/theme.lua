return {
    { 
      "xiyaowong/nvim-transparent",
      config = function()
      -- require('transparent').clear_prefix('lualine')
      -- require('transparent').clear_prefix('NeoTree')
      -- require('transparent').clear_prefix('Telescope')
      -- require('transparent').clear_prefix('BufferLine')
      
      require("notify").setup({
        background_colour = "#000000",
      })
    
      require("transparent").setup({
        groups = {
          'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
          'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
          'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
          'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
          'EndOfBuffer',
        },
        -- table: additional groups that should be cleared
        extra_groups = { -- table/string: additional groups that should be cleared
        "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        "NvimTreeNormal" -- NvimTree
        },
        -- table: groups you don't want to clear
        exclude_groups = {},
        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
      })

      -- Keymap to toggle transparency
      vim.api.nvim_set_keymap('n', '<leader>tt', ':TransparentToggle<CR>', { noremap = true, silent = true })
      end,
    },
    { 
      "Mofiqul/vscode.nvim", 
      priority = 1000, 
      config = true },
    { 
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "vscode",
      },
    },
  }
  
  -- { Mofiqul/vscode.nvim
  --  vscode }
  
  -- { dgox16/oldworld.nvim
  --  oldworld }
  
  -- { projekt0n/github-nvim-theme
  --  github_dark_colorblind }

  -- { craftzdog/solarized-osaka.nvim
  --  solarized-osaka }
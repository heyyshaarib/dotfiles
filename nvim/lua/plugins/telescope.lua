return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "BurntSushi/ripgrep" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = vim.fn.executable("make") == 1,
			},
			{ "nvim-telescope/telescope-symbols.nvim" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			-- Safe fallback functions
			local open_with_trouble = function(...)
				local ok, trouble = pcall(require, "trouble.providers.telescope")
				if ok then return trouble.open_with_trouble(...) end
			end

			local find_files_no_ignore = function()
				require("telescope.builtin").find_files({ no_ignore = true })
			end

			local find_files_with_hidden = function()
				require("telescope.builtin").find_files({ hidden = true })
			end

			telescope.setup({
				defaults = {
					wrap_results = true,
					mappings = {
						i = {
							["<esc>"] = actions.close,
							["<C-Down>"] = actions.cycle_history_next,
							["<C-Up>"] = actions.cycle_history_prev,
							["<C-f>"] = actions.preview_scrolling_down,
							["<C-b>"] = actions.preview_scrolling_up,
							["<c-t>"] = open_with_trouble,
							["<a-t>"] = open_with_trouble,
							["<a-i>"] = find_files_no_ignore,
							["<a-h>"] = find_files_with_hidden,
						},
					},
					layout_strategy = "horizontal",
					layout_config = {
						vertical = {
							width = 0.9,
							preview_cutoff = 1,
						},
					},
				},
				pickers = {
					lsp_references = { wrap_results = true },
					lsp_definitions = { wrap_results = true },
					diagnostics = { wrap_results = true },
					find_files = { wrap_results = true },
					buffers = { sort_mru = true, ignore_current_buffer = true },
				},
				extensions = {
					["ui-select"] = require("telescope.themes").get_dropdown({}),
				},
			})

			-- Load extensions
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
		end,

		keys = {
			{ "<leader>:",       "<cmd>Telescope command_history<cr>", desc = "Command History" },
			{
				"<leader>fo",
				function()
					require("telescope.builtin").oldfiles {
						prompt_title = "Recent files",
						sort_mru = true,
					}
				end,
				desc = "Old (recent) files"
			},
			{ "<leader><space>", "<cmd>Telescope buffers<cr>",         desc = "Buffers" },
			{ "<leader>b",       "<cmd>Telescope buffers<cr>",         desc = "Buffers" },
			{ "<leader>p",       "<cmd>Telescope buffers<cr>",         desc = "Buffers" },
			{ "<leader>ff",      "<cmd>Telescope find_files<cr>",      desc = "Find filenames" },
			{ "<leader>fm",      "<cmd>Telescope marks<cr>",           desc = "Marks" },
			{ "<leader>fw",      "<cmd>Telescope live_grep<cr>",       desc = "Grep files" },
			{ "<leader>ld",      "<cmd>Telescope diagnostics<cr>",     desc = "Diagnostics" },
			{
				"<leader>fb",
				function()
					require("telescope.builtin").live_grep {
						prompt_title = "Grep open files",
						grep_open_files = true,
					}
				end,
				desc = "Grep open files"
			},
			{
				"<leader>fc",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Grep this file"
			},
			{
				"<leader>ls",
				function()
					local ok = pcall(require, "aerial")
					if ok then
						require("telescope").extensions.aerial.aerial()
					else
						require("telescope.builtin").lsp_document_symbols()
					end
				end,
				desc = "Search symbols"
			},
			{ "<leader>gc", "<cmd>Telescope git_commits<CR>",               desc = "Commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<CR>",                desc = "Status" },
			{ '<leader>s"', "<cmd>Telescope registers<cr>",                 desc = "Registers" },
			{ "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "Auto Commands" },
			{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
			{ "<leader>sc", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>",       desc = "Document Diagnostics" },
			{ "<leader>sD", "<cmd>Telescope diagnostics<cr>",               desc = "Workspace Diagnostics" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>",                 desc = "Help Pages" },
			{ "<leader>sH", "<cmd>Telescope highlights<cr>",                desc = "Search Highlight Groups" },
			{ "<leader>sj", "<cmd>Telescope jumplist<cr>",                  desc = "Jumplist" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>",                   desc = "Key Maps" },
			{ "<leader>sl", "<cmd>Telescope loclist<cr>",                   desc = "Location List" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>",                 desc = "Man Pages" },
			{ "<leader>sm", "<cmd>Telescope marks<cr>",                     desc = "Jump to Mark" },
			{ "<leader>so", "<cmd>Telescope vim_options<cr>",               desc = "Options" },
			{ "<leader>sR", "<cmd>Telescope resume<cr>",                    desc = "Resume" },
			{ "<leader>sq", "<cmd>Telescope quickfix<cr>",                  desc = "Quickfix List" },
		},
	},
	{
		"stevearc/dressing.nvim",
		lazy = true,
		enabled = function()
			return vim.fn.exists(":Telescope") == 2
		end,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<C-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},
}
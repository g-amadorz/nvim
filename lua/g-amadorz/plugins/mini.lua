return {
	{
		"echasnovski/mini.pick",
		version = "*",
		config = function()
			local pick = require("mini.pick")
			pick.setup({
				delay = {
					async = 10,
					busy = 50,
				},
			})
			vim.keymap.set("n", "<leader>ff", pick.builtin.files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", pick.builtin.grep_live, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fb", pick.builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", pick.builtin.help, { desc = "Find help" })
			vim.keymap.set("n", "<leader>fr", pick.builtin.resume, { desc = "Resume picker" })
			vim.keymap.set("n", "<leader>f/", function()
				pick.builtin.grep({ pattern = vim.fn.input("Grep: ") })
			end, { desc = "Grep pattern" })
		end,
	},
	{
		"echasnovski/mini.animate",
		version = "*",
		config = function()
			local animate = require("mini.animate")
			animate.setup({
				-- Cursor path animation
				cursor = {
					enable = false,
				},
				-- Vertical scroll animation
				-- scroll = {
				-- 	enable = true,
				-- 	timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				-- },
				-- Window resize animation
				resize = {
					enable = true,
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
				-- Window open/close animation
				open = {
					enable = true,
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
				},
				close = {
					enable = true,
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
				},
			})
		end,
	},
	{
		"echasnovski/mini.bracketed",
		version = "*",
		config = function()
			require("mini.bracketed").setup({
				-- Configuration for different bracket types
				buffer = { suffix = "b", options = {} },
				comment = { suffix = "c", options = {} },
				conflict = { suffix = "x", options = {} },
				diagnostic = { suffix = "d", options = {} },
				file = { suffix = "f", options = {} },
				indent = { suffix = "i", options = {} },
				jump = { suffix = "j", options = {} },
				location = { suffix = "l", options = {} },
				oldfile = { suffix = "o", options = {} },
				quickfix = { suffix = "q", options = {} },
				treesitter = { suffix = "t", options = {} },
				undo = { suffix = "u", options = {} },
				window = { suffix = "w", options = {} },
				yank = { suffix = "y", options = {} },
			})
			-- Usage: [b/]b (buffer), [c/]c (comment), [d/]d (diagnostic), etc.
		end,
	},
	{
		"echasnovski/mini.notify",
		version = "*",
		config = function()
			local notify = require("mini.notify")
			notify.setup({
				-- Notifications content
				content = {
					-- Format for notification message
					format = nil,
					-- Function to sort notifications
					sort = nil,
				},
				-- Notifications window
				window = {
					config = {},
					max_width_share = 0.382,
					winblend = 25,
				},
			})
			-- Set as default notify function
			vim.notify = notify.make_notify()
		end,
	},
	{
		"nvim-mini/mini.icons",
		version = "*",
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		"nvim-mini/mini.statusline",
		version = "*",
		config = function()
			require("mini.statusline")
		end,
	},

	{
		"echasnovski/mini.files",
		version = "*",
		config = function()
			local files = require("mini.files")
			files.setup({
				-- Optional configuration
				windows = {
					preview = true,
					width_focus = 100,
					width_preview = 100,
				},
			})

			-- Don't call the function with (), just pass the function reference
			vim.keymap.set("n", "<leader>pv", function()
				files.open()
			end, { desc = "Open file explorer" })

			-- Or open at current file's directory
			vim.keymap.set("n", "<leader>pV", function()
				files.open(vim.api.nvim_buf_get_name(0))
			end, { desc = "Open file explorer at current file" })
		end,
	},

	{
		"echasnovski/mini.visits",
		version = "*",
		config = function()
			local visits = require("mini.visits")
			visits.setup({
				-- How to store visits data
				store = {
					-- Function to normalize path
					normalize = nil,
					-- Whether to autowrite on exit
					autowrite = true,
				},
				-- Silent mode (no notifications)
				silent = false,
			})

			-- Keymaps for visiting recent files
			vim.keymap.set("n", "<leader>vv", function()
				visits.select_path()
			end, { desc = "Select recent visit" })

			vim.keymap.set("n", "<leader>vl", function()
				visits.select_label()
			end, { desc = "Select by label" })

			-- Add current file to visits
			vim.keymap.set("n", "<leader>va", function()
				visits.add_label()
			end, { desc = "Add visit label" })

			-- Remove current file from visits
			vim.keymap.set("n", "<leader>vr", function()
				visits.remove_label()
			end, { desc = "Remove visit label" })

			-- List all visits for current directory
			vim.keymap.set("n", "<leader>vc", function()
				visits.iterate_paths("last", vim.fn.getcwd())
			end, { desc = "Recent visits (cwd)" })
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup({
				-- Module mappings
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`
				},

				-- Number of lines within which surrounding is searched
				n_lines = 20,

				-- Duration (in ms) of highlight when calling `highlight`
				highlight_duration = 500,

				-- Pattern to match function name in function call
				funname_pattern = "[%w_%.]+",

				-- Whether to respect selection type:
				-- - Place surroundings on separate lines in linewise mode.
				-- - Place surroundings on each line in blockwise mode.
				respect_selection_type = true,
			})
		end,
	},

	{
		"echasnovski/mini.jump",
		version = "*",
		config = function()
			require("mini.jump").setup({

				mappings = {
					forward = "f",
					backward = "F",
					forward_till = "t",
					backward_till = "T",
					repeat_jump = ";",
				},
				-- Delay before showing labels
				delay = {
					highlight = 250,
					idle_stop = 10000000,
				},
			})
		end,
	},

	{
		"sphamba/smear-cursor.nvim",
		opts = {
			stiffness = 0.6, -- 0.6      [0, 1]
			trailing_stiffness = 0.6, -- 0.45     [0, 1]
			stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
			trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
			distance_stop_animating = 0.1, -- 0.1      > 0
			use_floating_windows = false,
		},
	},
}

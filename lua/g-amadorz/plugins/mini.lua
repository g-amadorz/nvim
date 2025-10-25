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
					enable = true,
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
				-- Vertical scroll animation
				scroll = {
					enable = true,
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
				},
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
		"nvim-mini/mini.files",
		version = "*",
		config = function()
			require("mini.files")
		end,
	},
}

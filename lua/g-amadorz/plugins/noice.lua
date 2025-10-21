return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				-- Override hover and signature help to make them smaller
				hover = {
					enabled = true,
					silent = false,
					opts = {
						size = {
							max_width = 60,
							max_height = 20,
						},
						border = {
							style = "rounded",
						},
					},
				},
				signature = {
					enabled = true,
					auto_open = {
						enabled = true,
						trigger = true,
						luasnip = true,
						throttle = 50,
					},
					opts = {
						size = {
							max_width = 60,
							max_height = 15,
						},
						border = {
							style = "rounded",
						},
					},
				},
				-- Default documentation settings
				documentation = {
					view = "hover",
					opts = {
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						win_options = {
							concealcursor = "n",
							conceallevel = 3,
						},
						size = {
							max_width = 60,
							max_height = 20,
						},
						border = {
							style = "rounded",
						},
					},
				},
			},
		},
	},
}

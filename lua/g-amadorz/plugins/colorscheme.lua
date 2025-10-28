function ColorMyPencils(color)
	color = color or "cyberdream"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
					ColorMyPencils(),
				},
			})
		end,
	},

	{
		"armannikoyan/rusty",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			italic_comments = true,
			underline_current_line = true,
			colors = {
				foreground = "#c5c8c6",
				background = "#1d1f21",
				selection = "#373b41",
				line = "#282a2e",
				comment = "#969896",
				red = "#cc6666",
				orange = "#de935f",
				yellow = "#f0c674",
				green = "#b5bd68",
				aqua = "#8abeb7",
				blue = "#81a2be",
				purple = "#b294bb",
				window = "#4d5057",
			},
		},
		config = function(_, opts)
			require("rusty").setup(opts)
		end,
	},

	{
		"vague2k/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				-- optional configuration here
			})
		end,
	},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}

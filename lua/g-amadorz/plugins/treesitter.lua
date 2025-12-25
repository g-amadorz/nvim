return {

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,

		require("nvim-treesitter").setup({
			-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
			install_dir = vim.fn.stdpath("data") .. "/site",
		}),

		require("nvim-treesitter").install({ "rust", "c", "python", "c++" }),

		-- config = function()
		-- 	require("nvim-treesitter.configs").setup({
		-- 		ensure_installed = {
		-- 			"c",
		-- 			"cpp",
		-- 			"python",
		-- 			"html",
		-- 			"css",
		-- 			"matlab",
		-- 			"javascript",
		-- 			"lua",
		-- 			"vim",
		-- 			"vimdoc",
		-- 			"query",
		-- 		},
		--
		-- 		sync_install = false,
		-- 		auto_install = true,
		--
		-- 		autopairs = {
		-- 			enable = true,
		-- 		},
		--
		-- 		highlight = {
		-- 			enable = true,
		-- 			additional_vim_regex_highlighting = false,
		-- 		},
		--
		-- 		indent = {
		-- 			enable = true,
		-- 			--disable = { "python", "c" } -- these and some other langs don't work well
		-- 		},
		-- 	})
		-- end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
}

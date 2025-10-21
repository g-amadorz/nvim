return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		local builtin = require("telescope.builtin")
		local previewers = require("telescope.previewers")
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, { desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>f", builtin.find_files, { silent = true })
		vim.keymap.set("n", "<leader>r", ":Telescope oldfiles<CR>", { silent = true })
		vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Go to definition" })
		vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Go to implementation" })
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Go to references" })
		vim.keymap.set("n", "<leader>gt", builtin.lsp_type_definitions, { desc = "Go to type definition" })
		vim.keymap.set("n", "<leader>c", builtin.commands, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>lt", builtin.treesitter, { desc = "List functions" })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "List functions" })
		vim.keymap.set("n", "<leader>lq", "<cmd>Telescope diagnostics<CR>", { desc = "List functions" })
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}

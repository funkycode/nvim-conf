return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
			is_always_visible = function(name, _)
				return name == ".." or name == ".git"
			end,
		},
		float = {
			padding = 0,
			max_width = 90,
			max_height = 0,
		},
		keymaps = {
			["q"] = "actions.close",
			["<C-c>"] = false,
		},
	},
	keys = {
		{ "<leader>-", "<cmd>Oil --float<cr>", desc = "Open parent directory" },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

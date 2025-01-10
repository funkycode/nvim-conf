return {
	{
		"akinsho/toggleterm.nvim",
		enabled = false,
		version = "*",
		opts = {
			float_opts = {
				title_pos = "center",
			},
			direction = "float",
		},
		keys = {
			{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
			{ "<leader>tt", "<C-\\><C-n><C-w>l", mode = "t", desc = "Togge terminal" },
		},
	},
}

return {
	"Wansmer/treesj",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
	keys = {
		{
			"<leader>fs",
			"<cmd>:TSJToggle<cr>",
			desc = "Toggle node join/split",
		},
	},
}

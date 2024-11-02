return {
	"Wansmer/treesj",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
	keys = {
		{
			"<leader>ns",
			"<cmd>:TSJToggle<cr>",
			desc = "Toggle node join/split",
		},
	},
}

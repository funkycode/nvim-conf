return {
	"f-person/git-blame.nvim",
	opts = {
		enabled = false,
	},
	keys = {
		{
			"<leader>gbt",
			"<cmd>GitBlameToggle<cr>",
			desc = "Git blame toggle",
		},
	},
}

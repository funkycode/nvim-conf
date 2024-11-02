return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			heme = "catppuccin",
			component_separators = { left = "│", right = "│" },
			section_separators = { left = "▌", right = "▐" },
		},
		extensions = {
			-- "fzf",
			"lazy",
			"mason",
			"trouble",
			"oil",
			"quickfix",
		},
	},
}

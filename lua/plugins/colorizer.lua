return {
	{
		"norcalli/nvim-colorizer.lua",
		enabled = false,
		opts = {
			filetypes = { "html", "css" },
			user_default_options = {
				RRGGBBAA = true,
			},
		},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			render = "virtual",
			virtual_symbol_position = "eow",
			virtual_symbol_prefix = " ",
		},
	},
}

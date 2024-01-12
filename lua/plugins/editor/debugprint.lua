return {
	"andrewferrier/debugprint.nvim",
	opts = {
		create_keymaps = false,
		create_commands = false,
	},
	keys = {
		{
			"<leader>dpa",
			function()
				return require("debugprint").debugprint()
			end,
			expr = true,
			desc = "[printdebug] add debug line after",
		},
		{
			"<leader>dpb",
			function()
				return require("debugprint").debugprint({ above = true })
			end,
			expr = true,
			desc = "[printdebug] add debug line before",
		},
		{
			"<leader>dPa",
			function()
				return require("debugprint").debugprint({ variable = true })
			end,
			expr = true,
			desc = "[printdebug] add debug line after",
		},
		{
			"<leader>dPb",
			function()
				return require("debugprint").debugprint({ above = true, variable = true })
			end,
			expr = true,
			desc = "[printdebug] add debug line before",
		},
		{
			"<leader>dpc",
			function()
				return require("debugprint").deleteprints()
			end,
			desc = "[printdebug] clean all debug entries",
		},
	},
}

return {
	"nvim-neorg/neorg",
	enabled = false,
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/notes",
						neorg = "~/neorg",
					},
					default_workspace = "neorg",
				},
			},
		},
	},
}

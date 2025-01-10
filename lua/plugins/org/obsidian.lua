return {
	"epwalsh/obsidian.nvim",
	enabled = false,
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/obsidian/projects/batata.io",
			},
			-- {
			-- 	name = "work",
			-- 	path = "~/obsidian/projects/work",
			-- },
		},
	},
}

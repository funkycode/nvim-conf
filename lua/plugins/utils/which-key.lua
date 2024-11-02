return {
	"folke/which-key.nvim",
	enabled = true,
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		presets = {
			operators = true,
			motions = true,
			z = true,
			g = true,
		},
	},
	-- keys = {
	-- 	{
	-- 		"<leader>?",
	-- 		function()
	-- 			require("which-key").show({ global = false })
	-- 		end,
	-- 		desc = "Buffer Local Keymaps (which-key)",
	-- 	},
	-- },
	-- config = function()
	-- 	local config = require("which-key")
	-- 	config.register(mappings, opts)
	-- end,
}

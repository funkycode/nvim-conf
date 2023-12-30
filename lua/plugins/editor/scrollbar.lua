return {
	"petertriho/nvim-scrollbar",
	init = function()
		require("scrollbar.handlers.gitsigns").setup()
	end,
	opts = {},
}

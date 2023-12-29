return {
	"goolord/alpha-nvim",
	enabled = true,
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("F", "  Find File (ignore git)", ":Telescope find_files <CR>"),
			dashboard.button("b", "  File Browser", ":Telescope file_browser grouped=true <CR>"),
			dashboard.button("t", "  Find Text", ":Telescope live_grep <CR>"),
			dashboard.button("p", "  Projects", ":Telescope persisted<CR>"),
			dashboard.button("z", "  Search Zoxide", ":Telescope zoxide list<CR>"),
			dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
			dashboard.button("g", "  NeoGit", ":Neogit<CR>"),
			dashboard.button("l", "  Lazy", ":Lazy check<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}
		alpha.setup(dashboard.config)
	end,
}

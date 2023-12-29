return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jvgrootveld/telescope-zoxide",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- local z_utils = require("telescope._extensions.zoxide.utils")
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					persisted = {
						persisted = {
							layout_config = { width = 0.55, height = 0.55 },
						},
					},
					zoxide = {
						prompt_title = "[ Walking on the shoulders of TJ ]",
						mappings = {
							default = {
								after_action = function(selection)
									print("Update to (" .. selection.z_score .. ") " .. selection.path)
								end,
							},
							-- ["<C-s>"] = {
							--   before_action = function(selection)
							--     print("before C-s")
							--   end,
							--   action = function(selection)
							--     vim.cmd.edit(selection.path)
							--   end
							-- },
							-- ["<C-q>"] = { action = z_utils.create_basic_command("split") },
						},
					},
					undo = {},
					yank_history = {},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("persisted")
			require("telescope").load_extension("zoxide")
			require("telescope").load_extension("undo")
			require("telescope").load_extension("yank_history")
		end,
	},
}

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jvgrootveld/telescope-zoxide",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			"amiroslaw/telescope-changes.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			local extensions = require("telescope").extensions
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "TelescopeFindFiles" })
			vim.keymap.set(
				"n",
				"<leader>fg",
				extensions.live_grep_args.live_grep_args,
				{ desc = "TelescopeLiveGrepArgs" }
			)
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "TelescopeBuffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "TelescopeHelpTags" })
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "TelescopeLSPDocumentSymbols" })
			vim.keymap.set("n", "<leader>fi", "<cmd>AdvancedGitSearch<cr>", { desc = "TelescopeAdvancedGitSearch" })
			vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "TelescopeTreesitter" })
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "TelescopeOldFiles" })
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "TelescopeReferences" })
			vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "TelescopeImplementations" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "TelescopeGrepString" })
			vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "TelescopeJumplist" })
			vim.keymap.set("n", "<leader>fc", "<cmd>Telescope changes<cr>", { desc = "TelescopeChanges" })
			vim.keymap.set("n", "<leader>z", extensions.zoxide.list, { desc = "TelescopeZoxide" })
			vim.keymap.set("n", "<leader>c", builtin.spell_suggest, { desc = "TelescopeSpellSuggest" })
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
					file_browser = {},
					advanced_git_search = {
						diff_plugin = "diffview",
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("persisted")
			require("telescope").load_extension("zoxide")
			require("telescope").load_extension("undo")
			require("telescope").load_extension("yank_history")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("advanced_git_search")
			require("telescope").load_extension("changes")
		end,
	},
}

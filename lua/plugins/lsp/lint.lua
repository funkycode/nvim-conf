return {
	{
		"rshkarin/mason-nvim-lint",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
		opts = {
			ensure_installed = { "buf", "sqlfluff" },
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				go = {
					-- "revive",
					-- "golangci-lint",
				},
				json = {
					-- "cfn-lint",
					"jsonlint",
				},
				yaml = {
					"yamllint",
					--  "cfn-lint",
				},
				proto = {
					"buf_lint",
				},
				sql = {
					"sqlfluff",
				},
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>fl", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
}

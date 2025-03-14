return {
	{
		"zapling/mason-conform.nvim",
		dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
		opts = {
			ensure_installed = { "prettier", "stylua", "sqlfluff" },
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufWritePre", "BufNewFile" },
		cmd = { "ConformInfo" },
		keys = {
			-- Do I even need this, as I have autoformat on save anyway
			-- {
			-- 	-- Customize or remove this keymap to your liking
			-- 	"<leader>cf",
			-- 	function()
			-- 		require("conform").format({ async = true, lsp_fallback = true })
			-- 	end,
			-- 	mode = "",
			-- 	desc = "Format buffer",
			-- },
		},
		opts = {
			formatters = {
				sqlfluff = {
					args = {
						"format",
						"--dialect=ansi",
						"-",
					},
					require_cwd = false,
				},
			},
			formatters_by_ft = {
				go = { "goimports", "gofmt", "golines" },
				rust = { "rustfmt" },
				css = { "prettier" },
				html = { "prettier", "templ" },
				htmx = { "prettier", "templ" },
				toml = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier", "yamlfmt" },
				sql = { "sqlfluff" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				proto = { "buf" },
				justfile = { "just" },
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 800,
			},
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		keys = {
			{
				"<leader>xx",
				function()
					require("trouble").toggle()
				end,
				desc = "Trouble toggle",
			},
			{
				"<leader>xw",
				function()
					require("trouble").toggle("workspace_diagnostics")
				end,
				desc = "Trouble toggle workspace diagnostics",
			},
			{
				"<leader>xd",
				function()
					require("trouble").toggle("document_diagnostics")
				end,
				desc = "Trouble toggle document diagnostics",
			},
			{
				"<leader>xq",
				function()
					require("trouble").toggle("quickfix")
				end,
				desc = "Trouble toggle quickfix",
			},
			{
				"<leader>xl",
				function()
					require("trouble").toggle("loclist")
				end,
				desc = "Trouble toggle loclist",
			},
			{
				"gR",
				function()
					require("trouble").toggle("lsp_references")
				end,
				desc = "Trouble toggle LSP references",
			},
		},
	},
}

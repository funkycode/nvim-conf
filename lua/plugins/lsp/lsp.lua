return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"gopls",
				"golangci_lint_ls",
				"rust_analyzer",
				"helm_ls",
				"jsonls",
				"marksman",
				"taplo",
				"templ",
				"tflint",
				"hydra_lsp",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"gomodifytags",
				"impl",
				"goimports",
				"golines",
				"iferr",
				"gotests",
				"stylua",
				"golangci-lint",
				"json-to-struct",
				"prettier",
				"yamlfmt",
				"stylua",
				"jsonlint",
				"yamllint",
				"cfn-lint",
				-- TODO: check those too:
				"revive",
				-- 'misspell',
				-- 'shellcheck',
				-- 'staticcheck',
			},
			run_on_start = true,
			debounce_hours = 5,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({
				root_dir = require("lspconfig/util").root_pattern("go.mod", ".git"),
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						completeUnimported = true,
						usePlaceholders = true,
						-- TODO: uncomment once i figure out inlay hints and nvim-cmp-lsp
						-- ["ui.inlayhint.hints"] = {
						--   compositeLiteralFields = true,
						--   constantValues = true,
						--   parameterNames = true,
						-- },
					},
				},
			})
			lspconfig.golangci_lint_ls.setup({})
			lspconfig.helm_ls.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.templ.setup({})
			lspconfig.hydra_lsp.setup({})
			lspconfig.marksman.setup({})
			lspconfig.taplo.setup({})
			lspconfig.rust_analyzer.setup({})

			-- TODO:
			-- investigate the keys param or how to define keymaps per plugin or have global keys file

			-- keymaps:
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {
				desc = "Display information under cursor",
			})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
				desc = "Go to definition",
			})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {
				desc = "Code actions",
			})
		end,
		keys = {},
	},
}

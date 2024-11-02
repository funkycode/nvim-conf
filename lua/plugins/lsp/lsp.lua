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
				"htmx",
				-- "tailwindcss",
				"html",
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
				"htmlhint",
				"llm-ls",
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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				root_dir = require("lspconfig/util").root_pattern("go.mod", ".git"),
				settings = {
					gopls = {
						experimentalPostfixCompletions = true,
						analyses = {
							unreachable = true,
							nilness = true,
							unusedparams = true,
							shadow = true,
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
			lspconfig.golangci_lint_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.helm_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
			})
			lspconfig.hydra_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.taplo.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.htmx.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
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
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {
				desc = "Go to references",
			})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
				desc = "Go to implementation",
			})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
				desc = "Rename",
			})
		end,
		keys = {},
	},
}

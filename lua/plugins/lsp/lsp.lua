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
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				lua_ls = {},
				gopls = {
					single_file_support = true,
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
				},
				golangci_lint_ls = {},
				helm_ls = {},
				jsonls = {},
				marksman = {},
				taplo = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = true },
							completion = {
								autoimport = { enable = true },
							},
							imports = {
								granularity = {
									group = "module",
								},
								prefix = "self",
							},
						},
					},
				},
				templ = {},
				-- tflint = {},
				hydra_lsp = {},
				htmx = {},
				html = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for server, config in pairs(opts.servers or {}) do
				if server == "gopls" then
					config.root_dir = lspconfig.util.root_pattern("go.mod", ".git")
				end
				config.capabilities = require("blink.cmp").get_lsp_capabilities()
				lspconfig[server].setup(config)
			end
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

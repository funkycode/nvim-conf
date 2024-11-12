return {
	{
		"saghen/blink.cmp",
		enabled = true,
		lazy = false, -- lazy loading handled internally
		version = "v0.*",
		-- build = "cargo build --release",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		opts = {
			windows = {
				autocomplete = {
					-- winhighlight = "Normal:None,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
					border = "single",
					-- draw = {
					-- padding = { 1, 0 },
					-- components = {
					-- 	columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					-- },
					-- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					-- components = {
					-- 	kind_icon = { width = { fill = true } },
					-- columns = { { "kind_icon" }, { "label", gap = 1 } },
					-- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					-- },
					-- },
				},
				documentation = {
					winhighlight = "Normal:None,FloatBorder:BlinkCmpMenuBorder",
					border = "single",
					auto_show = true,
					auto_show_delay_ms = 0,
				},
			},
			accept = {
				auto_brackets = { enabled = true },
				--
			},
			keymap = { preset = "enter" },
			--
			highlight = {
				use_nvim_cmp_as_default = true,
			},
			nerd_font_variant = "mono",

			-- experimental signature help support
			trigger = {
				signature_help = {
					enabled = true,
				},
				completion = {
					show_in_snippet = true,
				},
			},
		},

		-- allows extending the enabled_providers array elsewhere in your config
		-- without having to redefining it
		-- opts_extend = { "sources.completion.enabled_providers" },
		signature_help = {
			enabled = true,
		},
		-- sources = {
		-- 	-- list of enabled providers
		-- 	completion = {
		-- 		enabled_providers = { "lsp", "path", "snippets", "buffer" },
		-- 	},
		-- },
	},

	-- nvim-cmp completion
	-- 	{
	-- 		"L3MON4D3/LuaSnip",
	-- 		dependencies = {
	-- 			"rafamadriz/friendly-snippets",
	-- 			--	"saadparwaiz1/cmp_luasnip",
	-- 		},
	-- 		config = function()
	-- 			require("luasnip.loaders.from_vscode").lazy_load({
	-- 				exclude = { "javascript" },
	-- 			})
	-- 		end,
	-- 	},
	--
	-- 	"hrsh7th/cmp-nvim-lsp",
	-- 	"hrsh7th/cmp-buffer",
	-- 	"hrsh7th/cmp-nvim-lsp-signature-help",
	-- 	{
	-- 		"hrsh7th/nvim-cmp",
	-- 		dependencies = {
	-- 			"petertriho/cmp-git",
	-- 			"chrisgrieser/cmp_yanky",
	-- 			"onsails/lspkind.nvim",
	-- 		},
	-- 		config = function()
	-- 			local cmp = require("cmp")
	-- 			local lspkind = require("lspkind")
	-- 			local luasnip = require("luasnip")
	--
	-- 			cmp.setup({
	-- 				snippet = {
	-- 					expand = function(args)
	-- 						luasnip.lsp_expand(args.body)
	-- 					end,
	-- 				},
	-- 				formatting = {
	-- 					format = lspkind.cmp_format({
	-- 						mode = "symbol_text",
	-- 						symbol_map = {
	-- 							Text = "",
	-- 							Method = "",
	-- 							Function = "",
	-- 							Constructor = "",
	-- 						},
	-- 						menu = {
	-- 							buffer = "[Buffer]",
	-- 							nvim_lsp = "[LSP]",
	-- 							luasnip = "[LuaSnip]",
	-- 							nvim_lua = "[Lua]",
	-- 							nvim_lsp_signature_help = "[Signature]",
	-- 							cmp_yanky = "[Clipboard]",
	-- 						},
	-- 					}),
	-- 				},
	-- 				window = {
	-- 					completion = cmp.config.window.bordered(),
	-- 					documentation = cmp.config.window.bordered(),
	-- 				},
	-- 				mapping = cmp.mapping.preset.insert({
	-- 					["<C-k>"] = cmp.mapping(function(fallback)
	-- 						if luasnip.jumpable(1) then
	-- 							luasnip.jump(1)
	-- 						else
	-- 							fallback()
	-- 						end
	-- 					end, { "i", "s" }),
	-- 					["<C-j>"] = cmp.mapping(function(fallback)
	-- 						if luasnip.jumpable(-1) then
	-- 							luasnip.jump(-1)
	-- 						else
	-- 							fallback()
	-- 						end
	-- 					end, { "i", "s" }),
	-- 					["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 					["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 					["<C-Space>"] = cmp.mapping.complete(),
	-- 					["<C-e>"] = cmp.mapping.abort(),
	-- 					["<CR>"] = cmp.mapping.confirm({ select = false }),
	-- 				}),
	-- 				sources = cmp.config.sources({
	-- 					{ name = "nvim_lsp" }, --keyword_length = 2 },
	-- 					{ name = "luasnip" }, --keyword_length = 2 },
	-- 					{ name = "nvim_lsp_signature_help" }, -- keyword_length = 3 },
	-- 					{ name = "buffer", keyword_length = 3 },
	-- 					{ name = "cmp_yanky" },
	-- 				}),
	-- 			})
	-- 			cmp.setup.filetype("gitcommit", {
	-- 				sources = cmp.config.sources({
	-- 					{ name = "git" },
	-- 					{ name = "buffer" },
	-- 				}),
	-- 			})
	-- 		end,
	-- 	},
}

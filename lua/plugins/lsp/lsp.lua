return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gomodifytags",
        "impl",
        "goimports",
        "golines",
        "iferr",
        "gotests",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
      },
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
            -- TODO: 
            -- uncomment once i figure out inlay hints and nvim-cmp-lsp
            -- ["ui.inlayhint.hints"] = {
            --   compositeLiteralFields = true,
            --   constantValues = true,
            --   parameterNames = true,
            -- },
          },
        },
      })

      -- TODO: 
      -- investigate the keys param or how to define keymaps per plugin or have global keys file

      -- keymaps:
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
        desc = "Display information under cursor",
      })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
        desc = "Go to definition",
      })
      vim.keymap.set({'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action,  {
        desc = "Code actions",
      })
    end,
    keys = {},

  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").load {
        exclude = { "javascript" },
      }
    end
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
            { name = 'buffer' },
          })
      })
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
            { name = 'buffer' },
          })
      })
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig')['gopls'].setup {
        capabilities = capabilities
      }

    end,
  },
  -- {},
}

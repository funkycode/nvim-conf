return {
  {
    "williamboman/mason.nvim",
    opts = {

    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        -- "goimports",
        -- "gofmt",
        -- "golines",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
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
  -- {},
  -- {},
}

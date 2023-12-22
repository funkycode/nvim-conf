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
  -- {},
}

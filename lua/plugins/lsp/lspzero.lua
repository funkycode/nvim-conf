return {
  {
    'williamboman/mason.nvim',
    opts = {
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
     opts = {
    },
  },
  {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      init = function()
        require('lsp-zero').on_attach(function(client, bufnr)
          lsp_zero.default_keymaps({buffer = bufnr})
        end)
      end,
      opts = {
      }
  },
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
}

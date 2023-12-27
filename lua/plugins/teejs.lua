return {
  'Wansmer/treesj',
  dependencies = {
    'vim-treesitter/nvim-treesitter',
  },
  opts = {},
  keys = {
    {
      "<leader>fs",
      "<cmd>:TSJToggle<cr>",
      desc = "Toggle node join/split",
    },
  },

}

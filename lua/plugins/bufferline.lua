return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      separator_style = "thin",
      offsets = {{filetype = "neo-tree", text = "File Explorer", text_align = "center"}},
    },
  },
}

return {
  "RRethy/vim-illuminate",
  config = function ()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
      },
      delay = 500,
      filetypes_denylist = {
        'startify',
        'NvimTree',
      },
    })
  end
}

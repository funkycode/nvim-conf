local hyper_theme = {
  disable_move = true,
  shortcut_type = "number",
  theme = "hyper",
  config = {
    disable_move = true,
    key_format = '[%s]',
    week_header = {
      enable = true,
    },
    shortcut = {
      {
        icon = ' ',
        desc = 'New file',
        action = 'enew | startinsert',
        group = '@string',
        key = 'n',
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = " ",
        desc = "Git",
        action = "Neogit",
        key = 'g',
      },
      {
        icon = ' ',
        desc = 'Update',
        group = '@string',
        action = 'Lazy sync',
        key = 'u',
      },
      {
        icon = ' ',
        desc = 'Quit',
        action = 'q!',
        group = '@macro',
        key = 'q',
      },
    },
    packages = { enable = true },
    -- project = { enable = true, limit = 8, label = 'Recent Projects:', action = 'Telescope find_files cwd=' },
    -- mru = { enable= true, limit = 10, label = 'Recent Files:', cwd_only = true },
    mru = { limit = 10 },
    project = { limit = 10, icon = "" },
  },
}

local doom_theme = {}




return {
  'nvimdev/dashboard-nvim',
  enabled = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VimEnter',
  opts = hyper_theme,
}

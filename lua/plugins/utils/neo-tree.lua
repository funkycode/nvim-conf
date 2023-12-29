return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "muniftanjim/nui.nvim",
  },
  opts = {
  },
  keys = {
    {'<C-b>', ':Neotree toggle<CR>', desc = "Open File Explorer"},
  },
  config = function()
    require("neo-tree").setup({
      source_selector = {
        winbar = true,
        statusline = false,
      },
      enable_git_status = true,
      window = {
        position = "left",
      },
      filesystem = {
        filtered_items = {
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        show_unloaded = true,
      },
      git_status = {
        window = {
          -- position = "float",
          mappings = {
            ["A"]  = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
            ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
            ["oc"] = { "order_by_created", nowait = false },
            ["od"] = { "order_by_diagnostics", nowait = false },
            ["om"] = { "order_by_modified", nowait = false },
            ["on"] = { "order_by_name", nowait = false },
            ["os"] = { "order_by_size", nowait = false },
            ["ot"] = { "order_by_type", nowait = false },
          }
        }
      }

    })
    vim.keymap.set('n', '<C-b>', ':Neotree toggle<CR>', {})
  end,
}

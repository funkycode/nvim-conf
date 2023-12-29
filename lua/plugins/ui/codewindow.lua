return {
  'gorbit99/codewindow.nvim',
  init = function()
    require('codewindow').apply_default_keybinds()
  end,
  opts = {
    active_in_terminals = false,
    exclude_filetypes = { 'help', 'neo-tree' },
    auto_enable = false,
    use_lsp = true,                                                                 -- Use the builtin LSP to show errors and warnings
    use_treesitter = true,                                                          -- Use nvim-treesitter to highlight the code
    use_git = true,                                                                 -- Show small dots to indicate git additions and deletions
    width_multiplier = 4,                                                           -- How many characters one dot represents
    z_index = 1,                                                                    -- The z-index the floating window will be on
    show_cursor = false,                                                            -- Show the cursor position in the minimap
    screen_bounds = 'background',                                                   -- How the visible area is displayed, "lines": lines above and below, "background": background color
    window_border = 'single',                                                       -- The border style of the floating window (accepts all usual options)
    relative = 'editor',                                                            -- What will be the minimap be placed relative to, "win": the current window, "editor": the entire editor
    events = { 'TextChanged', 'InsertLeave', 'DiagnosticChanged', 'FileWritePost' } -- Events that update the code window
  },
}

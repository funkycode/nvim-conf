return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", 
        "muniftanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<C-b>', ':Neotree toggle<CR>', {})
    end
}   

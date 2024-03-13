-- Neotree file explorer
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<CR>")
        require("neo-tree").setup({
            close_if_last_window = true,
            hijack_netrw_behaviour = "open_current",
            window = {
                width = 30
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
            },
        })
    end,
}

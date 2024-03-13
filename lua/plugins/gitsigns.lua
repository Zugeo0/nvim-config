
return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
        vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns preview_hunk<cr>")
        vim.keymap.set("n", "<leader>ge", "<cmd>Gitsigns preview_hunk_inline<cr>")
        vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>")
    end
}


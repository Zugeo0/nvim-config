
-- Lualine status bar
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            theme = "dracula"
        })

        vim.opt.showmode = false
    end
}

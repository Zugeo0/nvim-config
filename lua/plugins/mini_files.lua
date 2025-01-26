
return {
    'echasnovski/mini.files',
    version = '*',
    config = function()
        require("mini.files").setup({
            options = {
                use_as_default_explorer = false,
            }
        })

        vim.keymap.set("n", "<leader>s", ":lua MiniFiles.open()<CR>")
    end
}


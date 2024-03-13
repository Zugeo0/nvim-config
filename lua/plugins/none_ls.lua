
return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Formatters
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.gofmt,

                -- Linters
                null_ls.builtins.diagnostics.mypy.with({
                    extra_args = { "--strict" }
                }),
            }
        })
    end
}


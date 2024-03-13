
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    -- Enter normal mode in terminal
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

    -- Move between windows
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

    -- Idk
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

    -- Resize shortcuts
    vim.keymap.set("t", "<C-Up>", "<CMD>resize +2<CR>")
    vim.keymap.set("t", "<C-Down>", "<CMD>resize -2<CR>")
end

function _G.configure_toggleterm()
    local Terminal = require("toggleterm.terminal").Terminal

    -- Create terminals for terminal apps

    _G.term_lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        float_opts = {
            border = "single",
        },
        on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        on_close = function()
            vim.cmd("startinsert!")
        end
    })

    -- Shortcuts to open terminals

    vim.keymap.set("n", "<leader>gd", function() term_lazygit:toggle() end)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
vim.cmd("autocmd! User LazyDone lua configure_toggleterm()")

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        open_mapping = [[<C-\>]],
    },
}

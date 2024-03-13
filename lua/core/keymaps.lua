
-- Save and quit all windows
vim.keymap.set('n', '<leader>q', ":wqa<cr>")

-- Window navigation
vim.keymap.set('n', '<C-h>', "<cmd>wincmd h<cr>")
vim.keymap.set('n', '<C-j>', "<cmd>wincmd j<cr>")
vim.keymap.set('n', '<C-k>', "<cmd>wincmd k<cr>")
vim.keymap.set('n', '<C-l>', "<cmd>wincmd l<cr>")

-- Window resizing
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")


vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>;", "$a;<Esc>")
vim.keymap.set('n', '<S-Tab>', 'gg=G<C-o>', { desc = 'Indent whole file' })

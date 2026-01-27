return {
    'nvim-telescope/telescope.nvim', 
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    end
}

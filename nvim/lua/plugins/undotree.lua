return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require('undotree').setup({
      float_diff = true,  -- use float window for diff preview
      layout = "left_bottom", -- "left_bottom", "left_left_bottom"
      position = "left", -- "right", "bottom"
      ignore_filetype = {
        'undotree',
        'undotreeDiff',
        'qf',
        'TelescopePrompt',
        'spectre_panel',
        'tsplayground',
      },
      window = {
        winblend = 30,
        border = "rounded",
      },
      keymaps = {
        j = "move_next",
        k = "move_prev",
        gj = "move2parent",
        J = "move_change_next",
        K = "move_change_prev",
        ['<cr>'] = "action_enter",
        p = "enter_diffbuf",
        q = "quit",
      },
    })

    -- Keymap to toggle undotree
    vim.keymap.set('n', '<leader>u', require('undotree').toggle, { 
      noremap = true, 
      silent = true,
      desc = "Toggle undotree"
    })
  end,
}

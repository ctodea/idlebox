require("ctodea")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.lsp.start({
      name = "rust-analyzer",
      cmd = { "rust-analyzer" },
      root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml" }, { upward = true })[1]),
      settings = {
        ['rust-analyzer'] = {
          check = {
            command = "clippy",
          },
          diagnostics = {
            enable = true,
          },
        },
      },
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    
    -- Format and indent with Shift-Tab
    vim.keymap.set('n', '<S-Tab>', function()
      local pos = vim.api.nvim_win_get_cursor(0)
      vim.cmd('normal! gg=G')
      vim.lsp.buf.format({ async = false })
      vim.api.nvim_win_set_cursor(0, pos)
    end, opts)
  end,
})

vim.opt.clipboard = 'unnamedplus'

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

-- Inlay hint colors
vim.api.nvim_set_hl(0, 'LspInlayHint', {
  fg = '#fff700',
  italic = true,
})

-- Toggle inlay hints manually
vim.keymap.set('n', '<leader>h', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })

-- Lualine setup
require('lualine').setup({
  options = {
    theme = 'onedark',
    section_separators = '',
    component_separators = '|'
  }
})

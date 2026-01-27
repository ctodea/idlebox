return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- Install parsers
    require('nvim-treesitter').install({ 'rust', 'javascript', 'python', 'json', 'yaml', 'lua', 'vim' })
    
    -- Enable highlighting via autocmd
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'rust', 'javascript', 'python', 'json', 'yaml', 'lua', 'vim' },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end
}

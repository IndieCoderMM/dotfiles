local M = {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {}

      vim.keymap.set('n', '<leader>tc', ':ColorizerToggle<CR>', { desc = '[T]oggle [C]olorizer' })
    end,
  },
}

return M

return {
  {
    'mistweaverco/kulala.nvim',
    opts = {},
    config = function()
      vim.filetype.add {
        extension = {
          ['http'] = 'http',
        },
      }
      vim.keymap.set('n', '<leader>ar', function()
        require('kulala').run()
      end, { noremap = true, silent = true, desc = 'Run [A]pi [R]equest' })

      vim.keymap.set('n', '<leader>ai', function()
        require('kulala').inspect()
      end, { noremap = true, silent = true, desc = 'Toggle [A]pi [V]iew' })

      vim.keymap.set('n', '<leader>av', function()
        require('kulala').toggle_view()
      end, { noremap = true, silent = true, desc = 'Toggle [A]pi [V]iew' })

      vim.keymap.set('n', '<leader>ac', function()
        require('kulala').copy()
      end, { noremap = true, silent = true, desc = 'Copy [A]pi request as [C]url' })
    end,
  },
}

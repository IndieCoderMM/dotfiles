return {
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      {
        'folke/snacks.nvim',
        opts = {
          input = {},
          picker = {},
          terminal = {
            wo = {
              statuscolumn = '',
              statusline = '',
              winbar = '',
            },
          },
        },
      },
    },
    keys = {
      {
        '<leader>oa',
        function()
          require('opencode').ask('@this: ', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'Ask opencode',
      },
      {
        '<leader>os',
        function()
          require('opencode').select()
        end,
        mode = { 'n', 'x' },
        desc = 'Execute opencode action',
      },
      {
        '<leader>op',
        function()
          require('opencode').prompt '@this'
        end,
        mode = { 'n', 'x' },
        desc = 'Add to opencode',
      },
      {
        '<leader>oo',
        function()
          require('opencode').toggle()
        end,
        mode = { 'n', 't' },
        desc = 'Toggle opencode',
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true
    end,
  },
}

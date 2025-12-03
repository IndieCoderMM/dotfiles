return {
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      lazygit = {},
      styles = {
        lazygit = {
          border = true,
        },
      },
    },
    keys = {
      { '<leader>go', '<cmd>lua require("snacks").lazygit.open()<cr>', desc = 'Open LazyGit' },
    },
  },
}

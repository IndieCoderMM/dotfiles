local M = {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('kanagawa').setup {
        transparent = true,
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- Pmenu = { blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency (fg = theme.ui.shade0, bg = theme.ui.bg_p1)
            -- PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            -- PmenuSbar = { bg = theme.ui.bg_m1 },
            -- PmenuThumb = { bg = theme.ui.bg_p2 },
            CursorLine = { bg = theme.ui.background },
          }
        end,
        -- Remove background of LineNr
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
      }
      vim.cmd.colorscheme 'kanagawa-wave'
      vim.cmd 'highlight TelescopeBorder guibg=none'
      vim.cmd 'highlight TelescopeTitle guibg=none'
    end,
  },
}

return {}

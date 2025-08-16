return {
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   event = 'VeryLazy',
  --   enabled = false,
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     require('lualine').setup {
  --       options = { theme = 'gruvbox_dark', component_separators = '' },
  --       sections = {
  --         lualine_b = {
  --           { 'branch', icon = { '' } },
  --         },
  --         lualine_c = {
  --           'diagnostics',
  --         },
  --         lualine_x = {
  --           -- {
  --           --   'filetype',
  --           --   colored = true,
  --           --   icon_only = true,
  --           --   align = 'right',
  --           -- },
  --           function()
  --             local ok, pomo = pcall(require, 'pomo')
  --             if not ok then
  --               return ''
  --             end
  --
  --             local timer = pomo.get_first_to_finish()
  --             if timer == nil then
  --               return ''
  --             end
  --
  --             return '󰄉 ' .. tostring(timer)
  --           end,
  --           'diff',
  --           'filename',
  --           'window',
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    enabled = false,
    config = function()
      local logo = [[
  ██╗███╗   ██╗██████╗ ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗██████╗
  ██║████╗  ██║██╔══██╗██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗
  ██║██╔██╗ ██║██║  ██║██║█████╗  ██║     ██║   ██║██║  ██║█████╗  ██████╔╝
  ██║██║╚██╗██║██║  ██║██║██╔══╝  ██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗
  ██║██║ ╚████║██████╔╝██║███████╗╚██████╗╚██████╔╝██████╔╝███████╗██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝
        ]]
      logo = string.rep('\n', 1) .. logo .. '\n'

      require('dashboard').setup {
        config = {
          header = vim.split(logo, '\n'),
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              desc = '󰪺 Recents',
              group = 'DiagnosticHint',
              action = 'Telescope oldfiles',
              key = 'r',
            },
            {
              desc = '󰚝 Projects',
              group = 'DiagnosticHint',
              action = 'Telescope find_files cwd=~/Projects',
              key = 'p',
            },
            {
              desc = '󰴉 Workspaces',
              group = 'DiagnosticHint',
              action = 'Telescope find_files cwd=~/Pandora',
              key = 'w',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  -- {
  --   'akinsho/bufferline.nvim',
  --   event = 'VeryLazy',
  --   enabled = false,
  --   keys = {
  --     { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', mode = 'n', desc = 'Next tab' },
  --     { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', mode = 'n', desc = 'Prev tab' },
  --   },
  --   config = function()
  --     vim.opt.termguicolors = true
  --     local bufferline = require 'bufferline'
  --     bufferline.setup {
  --       options = {
  --         mode = 'tabs',
  --         show_buffer_close_icons = false,
  --         show_close_icon = false,
  --         themable = true,
  --       },
  --       highlights = {
  --         tab_separator = {
  --           fg = '#E46876',
  --         },
  --         tab_separator_selected = {
  --           fg = '#E46876',
  --           sp = '#E46876',
  --         },
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   'rcarriga/nvim-notify',
  --   opts = {
  --     timeout = 3000,
  --     background_colour = '#000000',
  --     render = 'wrapped-compact',
  --   },
  -- },
}

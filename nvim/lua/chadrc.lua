local M = {}

M.base46 = {
  theme = 'gruvchad',
  transparency = true,
}

M.ui = {
  cmp = {
    style = 'atom_colored',
  },
  statusline = {
    theme = 'default',
    separator_style = 'block',
    order = { 'M', 'file', 'git', '%=', '%=', 'diagnostics', 'cursor', 'cwd' },
    modules = {
      M = function()
        local config = require('nvconfig').ui.statusline
        local sep_style = config.separator_style
        local utils = require 'nvchad.stl.utils'

        local sep_icons = utils.separators
        local separators = (type(sep_style) == 'table' and sep_style) or sep_icons[sep_style]
        local sep_r = separators['right']
        if not utils.is_activewin() then
          return ''
        end

        local modes = utils.modes

        local m = vim.api.nvim_get_mode().mode

        local icons = {
          n = ' N',
          i = ' I',
          c = ' C',
          V = '󰀁 V',
          v = '󰀁 V',
          R = '󰬲 R',
          t = ' T',
          nt = ' T',
        }

        local show_mode = icons[m] ~= nil and icons[m] or string.upper(m)

        local current_mode = '%#St_' .. modes[m][2] .. 'Mode# ' .. show_mode
        local mode_sep1 = '%#St_' .. modes[m][2] .. 'ModeSep#' .. sep_r
        return current_mode .. mode_sep1 .. '%#ST_EmptySpace#' .. sep_r
      end,
      cursor = function()
        local config = require('nvconfig').ui.statusline
        local sep_style = config.separator_style
        local utils = require 'nvchad.stl.utils'

        local sep_icons = utils.separators
        local separators = (type(sep_style) == 'table' and sep_style) or sep_icons[sep_style]
        local sep_l = separators['left']

        return '%#St_pos_sep#' .. sep_l .. '%#St_pos_icon#󰍎 %#St_pos_text# %l/%v '
      end,
    },
  },
  tabufline = {
    order = { 'treeOffset', 'buffers', 'tabs' },
  },
  telescope = {
    style = 'bordered',
  },
}

M.lsp = {
  signature = false,
}

M.nvdash = {
  load_on_startup = true,

  header = {
    '██╗███╗   ██╗██████╗ ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗██████╗',
    '██║████╗  ██║██╔══██╗██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗',
    '██║██╔██╗ ██║██║  ██║██║█████╗  ██║     ██║   ██║██║  ██║█████╗  ██████╔╝',
    '██║██║╚██╗██║██║  ██║██║██╔══╝  ██║     ██║   ██║██║  ██║██╔══╝  ██╔══██╗',
    '██║██║ ╚████║██████╔╝██║███████╗╚██████╗╚██████╔╝██████╔╝███████╗██║  ██║',
    '╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝',
    '                                                                         ',
  },
}

M.term = {
  winopts = {
    number = false,
    relativenumber = false,
  },
}

M.colorify = {
  enabled = true,
}

return M

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
  },
  tabufline = {
    order = { 'treeOffset', 'buffers', 'tabs' },
  },
  telescope = {
    style = 'bordered',
  },
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

return M

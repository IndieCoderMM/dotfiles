require 'config.options'
require 'config.keys'

vim.g.base46_cache = vim.fn.stdpath 'data' .. '/base46_cache/'

-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
    opts = {
      rocks = {
        hererocks = false,
      },
    },
  },
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup {
        icons = {
          mappings = vim.g.have_nerd_font,
        },
      }
      -- Document existing key chains
      require('which-key').add {
        { '<leader>a', group = '[A]pi', icon = { icon = '', color = 'red' } },
        { '<leader>c', group = '[C]ode', icon = { icon = '󰅱', color = 'green' } },
        { '<leader>d', group = '[D]ocument', icon = { icon = '󰅩', color = 'yellow' } },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>g', group = 'Lazy[G]it', icon = { icon = '󰊢', color = 'red' } },
        { '<leader>`', group = 'Terminal', icon = { icon = '', color = 'orange' } },
        { ';a', icon = { icon = '󰛢', color = 'azure' } },
      }
    end,
  },
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  { import = 'custom.plugins' },
  -- require 'custom.plugins',
}

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

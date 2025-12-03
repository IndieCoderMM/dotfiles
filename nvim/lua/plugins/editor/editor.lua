return {

  -- {
  --   'FabijanZulj/blame.nvim',
  --   lazy = false,
  --   config = function()
  --     require('blame').setup {}
  --   end,
  --   keys = {
  --     { '<leader>gb', '<cmd>BlameToggle virtual<cr>', desc = '[G]it [B]lame view' },
  --   },
  -- },
  -- {
  --   'kdheepak/lazygit.nvim',
  --   cmd = {
  --     'LazyGit',
  --     'LazyGitConfig',
  --     'LazyGitCurrentFile',
  --     'LazyGitFilter',
  --     'LazyGitFilterCurrentFile',
  --   },
  --   -- optional for floating window border decoration
  --   -- dependencies = {
  --   --   'nvim-lua/plenary.nvim',
  --   -- },
  --   -- setting the keybinding for LazyGit with 'keys' is recommended in
  --   -- order to load the plugin when the command is run for the first time
  --   keys = {
  --     { '<leader>go', '<cmd>LazyGit<cr>', desc = 'Open LazyGit' },
  --   },
  -- },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▐' },
        change = { text = '▐' },
        delete = { text = '▐' },
        topdelete = { text = '▐' },
        changedelete = { text = '▐' },
        untracked = { text = '▐' },
      },
    },
  },
  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
    keys = {
      { '<leader>st', '<cmd>TodoTelescope<CR>', desc = '[S]earch [T]odo' },
    },
  },
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>tu', "<cmd>lua require('undotree').toggle()<cr>", desc = '[T]oggle [U]ndo Tree' },
    },
  },
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = true },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { 'node_modules' },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'file_browser')
      pcall(require('telescope').load_extension, 'emoji')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sq', builtin.diagnostics, { desc = '[S]earch [Q]uickfix diagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- File browser
      vim.keymap.set('n', '<leader>sb', ':Telescope file_browser<CR>', { desc = '[S]earch file [B]rowser' })
      -- base46 Colorschemes
      vim.keymap.set('n', '<leader>s4', ':Telescope themes<CR>', { desc = '[S]earch base[4]6 themes' })
      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      -- Shortcut for searching commits
      vim.keymap.set('n', '<leader>sc', function()
        builtin.git_commits {}
      end, { desc = '[S]earch [C]ommits' })
    end,
  },
  -- {
  --   'barrett-ruth/import-cost.nvim',
  --   build = 'sh install.sh yarn',
  --   config = true,
  -- },
  -- {
  --   'nvim-telescope/telescope-file-browser.nvim',
  --   dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  -- },
}

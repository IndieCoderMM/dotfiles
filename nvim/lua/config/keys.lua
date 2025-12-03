local map = vim.keymap.set

-- Increment/decrement
map('n', '+', '<C-a>', { desc = 'Increment number' })
map('n', '-', '<C-x>', { desc = 'Decrement number' })

-- Splits
map('n', 'ss', ':split<CR>', { desc = 'Split [S]creen' })
map('n', 'sv', ':vsplit<CR>', { desc = 'Split [V]ertical' })

--  Window navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })

-- Utils
map('n', '<C-y>', 'ggVG', { desc = 'Select all' })

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>k', vim.diagnostic.open_float, { desc = 'See diagnostic message' })
map('n', '<leader>j', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>l', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })

-- Terminal
map('n', '<leader>``', '<cmd>tabnew +term<CR>', { desc = '[N]ew tab terminal' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
--
-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = 'term://*',
--   callback = function()
--     vim.opt_local.laststatus = 0
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('BufLeave', {
--   pattern = 'term://*',
--   callback = function()
--     vim.opt_local.laststatus = 3 -- Or 1
--   end,
-- })

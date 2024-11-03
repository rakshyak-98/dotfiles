-- @param mod n|i|v|x
-- @param cmd string
-- @param vim_cmd string
-- @param desc table
local function map(mod, cmd, vim_cmd, desc)
  local opt = { noremap = true, silent = true, desc=desc }
  vim.keymap.set(mod, cmd, vim_cmd, opt)
end

-- [[ Basic Keymaps ]]
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- use vim.otp.nohlsearch = true
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<leader>pf', '<Cmd>Explore<CR>')
map('v', '<leader>s', ':sort ')
-- vim.keymap.set('n', 'ff', format, {desc = 'Format the current buffer'})
map('n', ']', ':bprevious')
map('n', '[', ':bnext')
map('n', '<leader>x', ':bd')

-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

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
--]]

-- [[ System command ]]
-- vim.api.nvim_set_keymap('n', '<M-h>', '', { noremap = true, silent = true })

-- ]]

-- vim: ts=2 sts=2 sw=2 et

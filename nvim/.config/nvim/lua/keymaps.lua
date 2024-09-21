-- @param mod n|i|v|x
-- @param cmd string
-- @param vim_cmd string
local function map(mod, cmd, vim_cmd)
  local opt = {noremap = true, silent = true}
  vim.keymap.set(mod, cmd, vim_cmd .. '<CR>', opt)
end

-- [[ Basic Keymaps ]]
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- use vim.otp.nohlsearch = true
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('v', '<leader>s', ':sort ')

-- vim.keymap.set('n', 'ff', format, {desc = 'Format the current buffer'})
map('n', ']', ':bprevious')
map('n', '[', ':bnext')
map('n', '<leader>x', ':bd')
map('n',  '<leader>ff', ':Explore')

--]]

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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

-- [[ to make life easy ]]
vim.api.nvim_set_keymap('n', '<leader>rl', ':Lazy reload ', { noremap = true, desc = "Reload plugin for current buffer"})
-- ]]

-- [[ System command ]]
-- vim.api.nvim_set_keymap('n', '<M-h>', '', { noremap = true, silent = true })

-- ]]

-- vim: ts=2 sts=2 sw=2 et

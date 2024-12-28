-- Helper function to set keymaps
local function map(mod, cmd, vim_cmd, desc)
  local opt = { noremap = true, silent = true, desc=desc }
  vim.keymap.set(mod, cmd, vim_cmd, opt)
end

-- [[ Basic Keymaps ]]
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>pv', '<Cmd>Explore<CR>')
map('v', '<leader>s', ':sort ') -- yes I want it that way
-- vim.keymap.set('n', 'ff', format, {desc = 'Format the current buffer'}) -- fix this to enable formatting
map('n', ']', '<Cmd>bprevious<CR>')
map('n', '[', '<Cmd>bnext<CR>')
map('n', '<leader>x', '<Cmd>bd<CR>')

-- [[ Terminal Keymaps ]]
map('n', '<C-t>', '<Cmd>OpenTerminal<CR>', { desc = 'Open terminal' }) -- this won't work with you

-- [[ Disable Arrow Keys in Normal Mode ]]
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- [[ Split Navigation ]]
-- Use CTRL+<hjkl> to switch between windows
-- See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ System Command Keymaps ]]
-- vim.api.nvim_set_keymap('n', '<M-h>', '', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et

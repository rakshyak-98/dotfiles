-- @param mod n|i|v|x
-- @param cmd string
-- @param vim_cmd string
-- @param desc table
local function map(mod, cmd, vim_cmd, desc)
  local opt = { noremap = true, silent = true, desc=desc }
  vim.keymap.set(mod, cmd, vim_cmd, opt)
end

-- [[ Basic Keymaps ]]
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>pv', '<Cmd>Explore<CR>')
map('v', '<leader>s', ':sort ') -- yes I wnat it that way
-- vim.keymap.set('n', 'ff', format, {desc = 'Format the current buffer'}) -- fix this to enable formating
map('n', ']', '<Cmd>bprevious<CR>')
map('n', '[', '<Cmd>bnext<CR>')
map('n', '<leader>x', '<Cmd>bd<CR>')
map('n', '<C-t>', '<Cmd>OpenTerminal<CR>', { desc = 'Open terminal' }) -- this won't work with you

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

-- [[ System command ]]
-- vim.api.nvim_set_keymap('n', '<M-h>', '', { noremap = true, silent = true })

-- ]]

-- vim: ts=2 sts=2 sw=2 et

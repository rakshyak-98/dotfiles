-- [[ Setting options ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.cmd(':colorscheme habamax')
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'v'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.tabstop = 2
vim.opt.laststatus = 3
vim.opt.shiftwidth = 2

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250

vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab= '  ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
--]] vim: ts=2 sts=2 sw=2 et

-- [[ set optoin ]]
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = "None" })
-- ]]

-- Global variables
tabspace = 2
local map_leader = " "
vim.cmd('colorscheme habamax')

-- Global mapping
vim.g.mapleader = map_leader 
vim.g.maplocalleader = map_leader 

require('options')
require('keymaps')
require('configs.lazy-setup')
require('commands')
-- Dont import plugin here use the lazy to include plugins

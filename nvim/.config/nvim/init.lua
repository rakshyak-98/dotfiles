-- Global variables
tabspace = 2
local map_leader = " "

-- Global mapping
vim.g.mapleader = map_leader 
vim.g.maplocalleader = map_leader 

require('options')
require('keymaps')
require('plugins')
require('configs.lazy-setup')

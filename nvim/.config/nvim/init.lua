-- Global variables
local map_leader = " "
--
-- Global mapping
vim.g.mapleader = map_leader
vim.g.maplocalleader = map_leader
require('options')
require('keymaps')
vim.cmd('colorscheme habamax')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	}
}, {
	rocks = {
		hererocks = false, -- Prevent usage of hererocks
		enabled = false,   -- Disable luarocks support completely
	},
})

require('commands')
-- Dont import plugin here use the lazy to include plugins

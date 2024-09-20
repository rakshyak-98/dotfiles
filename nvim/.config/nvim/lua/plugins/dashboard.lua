return {
"nvimdev/dashboard-nvim",
	dependencies = { {'nvim-tree/nvim-web-devicons'}},
	event = "VimEnter",
	config = function ()
		require "dashboard".setup({
			theme = "hyper",
			packages = {enable = true},
			 config = {
				week_header = {
					enable = true
				},
				shortcut = {
					{desc = 'Update', group = '@property', action = 'Lazy update', key = 'u'},
				},
			}
		})
	end
}

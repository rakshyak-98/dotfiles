local function search_nvim_config()
	local builtin = require('telescope.builtin')
	builtin.find_files({
		prompt_title = "Search Config Files",
		cwd = "~/.config/nvim/",
	})
end

local function search_projects()
	local builtin = require('telescope.builtin')
	builtin.find_files({
		prompt_title = "Search github projects",
		cmd = "~/Practice"
	})
end

return {
	'nvim-telescope/telescope.nvim',
	event = 'BufEnter',
	keys = {
		{ '<leader>fc', function() search_nvim_config() end},
		{ '<leader>fp', function() search_projects() end},
		{ '<leader>ff', ':Telescope<CR>' },
	},
	opts = function()
		require('telescope').setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git",
					".env",
					"*.log"
				}
			},
		})
		require('telescope').load_extension('harpoon')
	end,
	config = true,
	dependencies = {
		{ 'nvim-lua/plenary.nvim' } ,
	},
}

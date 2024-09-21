return {
	'nvim-lualine/lualine.nvim',
	opts = {
		options = {
			icons_enabled = false,
			component_separators = '',
			section_separators = '',
		}
	},
	refresh = {
		statusline = 6000
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { 'filename' },
		lualine_x = {
			'buffers',
			show_filename_only = true,
			show_modified_status = true,
		}
	}
}

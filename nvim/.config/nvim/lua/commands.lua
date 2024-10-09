vim.api.nvim_create_user_command('ReloadHarpoon', function()
	require('harpoon').setup()
end, {})

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = { 'javascript', 'typescript', 'go', 'html', 'css' },
		})
	end
}

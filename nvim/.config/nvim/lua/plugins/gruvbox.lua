return {
	"ellisonleao/gruvbox.nvim",
	lazy = true,
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			italic = { comments = true }
		})
		vim.cmd("colorscheme gruvbox")
	end
}

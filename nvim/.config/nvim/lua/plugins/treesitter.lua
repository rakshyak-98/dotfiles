return {
	"nvim-teesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true
			}
		})
	end
}

return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim"
	},
	window = {
		position = "right"
	},
	config = function()
		require("neo-tree").setup()
	end
}

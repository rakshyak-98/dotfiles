return {
	"stevearc/conform.nvim",
	event = { 'BufReadPre' },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
		javascript = { "prettier" },
			typescript = { "prettier" },
		},
	},
	keys = {
		{ "ff",
			function()
				require("conform").format( {async = true })
			end,
			mode = "",
			desc = "Format file",
		},
	},
}

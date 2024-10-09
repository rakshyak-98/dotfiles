return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'L3MON4D3/LuaSnip' }
	},
	config = function()
		local cmp = require('cmp')
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = {
				['<C-n>'] = cmp.mapping.select_next_item,
				['<C-p>'] = cmp.mapping.select_prev_item,
				['<Tab>'] = cmp.mapping.confirm({select = true}),
			},
			source = {
				{ name = 'nvim_lsp'},
				{ name = 'buffer' },
				{ name = 'path' },
				{ name = 'luasnip' },
			},
			experimental = {
				ghost_text = true
			},
		})
	end,
}

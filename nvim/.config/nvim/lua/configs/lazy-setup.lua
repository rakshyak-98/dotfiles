local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration
require("lazy").setup({
	{ 'ThePrimeagen/harpoon', 
	config = function()
		require('harpoon').setup({})

		local mark = require('harpoon.mark')
		local ui = require('harpoon.ui')

		vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Add to Harpoon'})
		vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu, { desc = 'Toggle Harpoon Menu'})

		-- navigation to Harpoon marks
		vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)	
		vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)	
		vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)	
		vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)	

	end,
	dependencies = { 
		{ 'nvim-telescope/telescope.nvim', 
		defaults = {
			file_ignore_patterns = { 'node_modules/', '.git/', '*.log', '*.tmp', '.env/', '/bin', '/usr' }
		},
		config = function()
			require('telescope').setup()
			require('telescope').load_extension('harpoon')
		end,
		dependencies = { 
			{ 'nvim-lua/plenary.nvim' } ,
		}, }
	}, 
},
{ "neovim/nvim-lspconfig", config = function()
	local lspconfig = require('lspconfig')
	lspconfig.gopls.setup({})
end},
{	"williamboman/mason.nvim", config = function()
	require('mason').setup()
end},
{	"williamboman/mason-lspconfig.nvim" },
{ 'hrsh7th/nvim-cmp',
dependencies = {
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
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
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-y>'] = cmp.mapping.confirm({select = true}),
		},
		source = {
			{ name = 'nvim_lsp'},
			{ name = 'buffer' },
			{ name = 'path' },
		}
	})
end},
{ 'nvim-treesitter/nvim-treesitter',
build = ':TSUpdate',
config = function()
	require('nvim-treesitter.configs').setup({
		ensure_installed = { 'javascript', 'typescript', 'go', 'html', 'css' },
	})
end
},
{ 'nvim-lualine/lualine.nvim',
config = function()
	require('lualine').setup({
		options = {
			theme = 'auto'
		}
	})
end,
}
}, {
	rocks = {
		hererocks = false, -- Prevent usage of hererocks
		enabled = false,   -- Disable luarocks support completely
	},
}	)


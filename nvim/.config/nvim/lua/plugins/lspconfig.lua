return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local on_attach = function()
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover)
		end
		lspconfig.vtsls.setup({
			capabilities = require('cmp_nvim_lsp').default_capabilities()
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },   -- Add other global variables if needed
					},
				},
			},
		})
		lspconfig.gopls.setup({
			capabilities = capabilities
		})
		lspconfig.bashls.setup({
			capabilities = capabilities
		})
	end
}

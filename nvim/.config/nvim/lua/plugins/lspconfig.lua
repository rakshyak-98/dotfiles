-- LSP Plugins
return {
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'neovim/nvim-lspconfig',
    autoformat = true,
    dependencies = {
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      {'williamboman/mason-lspconfig.nvim'},
      {'WhoIsSethDaniel/mason-tool-installer.nvim'},
      { 'j-hui/fidget.nvim', opts = {} },
      {'hrsh7th/cmp-nvim-lsp'}, -- Allows extra capabilities provided by nvim-cmp
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('gtd', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('gds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>rr', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        end
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local opts = {
        setup = {
          clangd = function(_, opts)
            opts.cmd = { "clangd", "--header-insertion=never" }
          end,
        },
      }
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local servers = {
        ts_ls = {
          opts =  opts
        },
        lua_ls = {
          opts = opts,
          settings = {
            Lua = {
              diagnostics = {
                disable = { 'missing-fields' },
                globals = {'vim'} -- do this otherwise get 'Undefined globals vim' error
              },
            },
          },
        },
      }

      require('mason').setup()
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

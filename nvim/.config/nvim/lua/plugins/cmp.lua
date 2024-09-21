return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    opts = function()
      local cmp = require 'cmp'
      return {
        auto_brackets = {'typescript', 'lua', 'javascript'},
        completion = { completeopt = 'noinsert' , autocomplete = false},
        experimental = {
          ghost_text = true
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<TAB>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
        },
        sources = {
          {
            name = 'lazydev',
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
        window = {
          documentation = cmp.config.window.bordered(),
        }
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

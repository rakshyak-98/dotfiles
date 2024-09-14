-- [[ Configure and install plugins ]]
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },
  spec = {
    {import = "plugins"},
  },
  checker = {
    enabled = false
  },
  defaults = {
    version = "*",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      }
    }
  },
  ui = {
    icons = {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- ]] vim: ts=2 sts=2 sw=2 et

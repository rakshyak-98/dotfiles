local plugin = {
  'nvim-telescope/telescope.nvim',
  opts = function()
    local conf = require('nvchad.configs.telescope')
  end
}

return plugin

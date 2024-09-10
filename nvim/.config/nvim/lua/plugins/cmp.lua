local cmp = require "cmp"
cmp.setup {
  ghost_text = true,
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  },
}
return cmp

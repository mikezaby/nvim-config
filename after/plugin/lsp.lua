local lsp = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver', 
    'eslint',
    'rust_analyzer'
  },
  handlers = {
    lsp.default_setup,
  },
})

local cmp = require('cmp')

cmp.setup({
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'buffer' },
  })
})

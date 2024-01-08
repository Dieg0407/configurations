local configuration = {}

-- this functions will setup the cmp configuration
function configuration.setup()
  local cmp = require("cmp")

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources(
      {{ name = 'nvim_lsp' }, { name = 'vsnip' }},
      {{ name = 'buffer' }}
    )
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({{ name = 'cmp_git' }}, 
      {{ name = 'buffer' }}
    )
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' }}
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {{ name = 'path' }},
      {{ name = 'cmdline' }}
    )
  })

  return require("cmp_nvim_lsp").default_capabilities()
end

return configuration

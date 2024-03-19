return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function(PlugSpec, opts)
      require("mason").setup(opts)
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "clangd", "terraformls" }
    },
    config = function(PlugSpec, opts)
      require("mason-lspconfig").setup(opts)
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      }
      lspconfig.rust_analyzer.setup {}
      lspconfig.clangd.setup {}
      lspconfig.terraformls.setup {}
      lspconfig.tsserver.setup {}

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', '<Leader>d', vim.lsp.buf.hover)
          vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<Leader>k', vim.lsp.buf.signature_help, opts)

          vim.keymap.set('n', '<Leader>td', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, opts)
        end,
      })
    end,
  }
}

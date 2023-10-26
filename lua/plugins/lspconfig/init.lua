local cmp_configuration = require("plugins.lspconfig.nvim-cmp")

local plugin = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- cmp dependencies to be used as capabilities
    "hrsh7th/nvim-cmp",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip"
  },
  config = function()

    vim.keymap.set('n', '<Leader>d', vim.lsp.buf.hover)
    vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<Leader>k', vim.lsp.buf.signature_help, opts)

    vim.keymap.set('n', '<Leader>td', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<Leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)

    local capabilities = cmp_configuration.setup()

    local lua_language_server = require("plugins.lspconfig.lua-language-server")
    lua_language_server.configure(capabilities)

    local tsserver = require("plugins.lspconfig.tsserver")
    tsserver.configure(capabilities)

    local pyright = require("plugins.lspconfig.pyright")
    pyright.configure(capabilities)

    local rust_analyzer = require("plugins.lspconfig.rust_analyzer")
    rust_analyzer.configure(capabilities)

    local gradle_ls = require("plugins.lspconfig.gradle-ls")
    gradle_ls.configure(capabilities)


  end
}

return plugin

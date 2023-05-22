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

    -- Global mappings.
    vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float)
    vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

    local capabilities = cmp_configuration.setup()

    local lua_language_server = require("plugins.lspconfig.lua-language-server")
    lua_language_server.configure(capabilities)
  end
}

return plugin

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function(_, opts)
      require("mason").setup(opts)
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "clangd", "terraformls", "pyright", "gopls" }
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end
  }
}

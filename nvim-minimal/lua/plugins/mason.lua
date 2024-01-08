local plugin = {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  lazy = false,
  config = function ()
    require("mason").setup {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "tsserver",
        "omnisharp",
        "pyright"
      }
    }
  end
}

return plugin

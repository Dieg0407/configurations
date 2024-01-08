local plugin = {
  "nvim-treesitter/nvim-treesitter",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "rust", "javascript", "typescript", "c_sharp" },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

return plugin

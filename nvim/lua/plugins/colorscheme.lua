--  {
--    "folke/tokyonight.nvim",
--    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--    priority = 1000, -- make sure to load this before all the other start plugins
--    config = function()
--      -- load the colorscheme here
--      vim.cmd([[colorscheme tokyonight-night]])
--    end,
--  }
--  {
--    "Shatur/neovim-ayu",
--    lazy = false,
--    config = function()
--      require("ayu").setup({
--        overrides = {
--         Normal = { bg = "None" }
--        }
--      })
--
--      vim.cmd.colorscheme "ayu"
--    end
--  }
--
return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
      require("onedark").setup({})
      vim.cmd.colorscheme "onedark"
    end
  }
}

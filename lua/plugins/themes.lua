local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  config = function ()
    require("catppuccin").setup({
      flavour = "macchiato",
      background = {
        dark = "macchiato"
      },
      transparent_background = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end
}

local ayu = {
  "Shatur/neovim-ayu",
  lazy = false,
  config = function()
    require("ayu").setup({
      overrides = {
        Normal = { bg = "None" }
      }
    })

    vim.cmd.colorscheme "ayu"
  end
}

return ayu
